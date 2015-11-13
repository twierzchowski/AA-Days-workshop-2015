(function($) {
    "use strict";

    Function.prototype.debounce = function(threshold, execAsap) {

        var func = this,
            timeout;

        return function debounced() {
            var obj = this,
                args = arguments;

            function delayed() {
                if (!execAsap)
                    func.apply(obj, args);
                timeout = null;
            }

            if (timeout)
                clearTimeout(timeout);
            else if (execAsap)
                func.apply(obj, args);

            timeout = setTimeout(delayed, threshold || 100);
        };

    };

    $(".task-list__task__delete").on("click", function(event) {
        var $this = $(this);

        $this.attr("disabled", true);

        $.ajax({
            url: "/lists/" + $this.attr("data-list-id") + "/products/" + $this.attr("data-task-id"),
            type: "DELETE",
            success: function() {
                window.location.reload();
            },
            error: function(error) {
                console.error(error);
            }
        });

        event.preventDefault();
        return false;
    });

    $(".task-state + label").on("mousedown", function(event) {
        var $this = $(this);
        var $cb = $this.prev();
        var originalChecked = $cb.prop("checked");
        if ($cb.attr("disabled")) {
            return false;
        }

        $(document).one("mouseup", function(event) {
            var taskContainer = $cb.parents(".task-list__task");
            $cb.attr("disabled", "disabled");

            $.ajax({
                url: "/lists/" + $cb.attr("data-list-id") + "/products/" + $cb.attr("data-task-id") +
                    "/toggle",
                type: "POST",
                success: function() {
                    $cb.prop("checked", !originalChecked);
                    $this.text((originalChecked ? "Buy" : "Bought"));
                    taskContainer.toggleClass("task-list__task--done");
                    $cb.removeAttr("disabled");
                },
                error: function(error) {
                    document.write(error.responseText);
                }
            });

            event.preventDefault();
        });

        event.stopImmediatePropagation();
    });

    $("#product_name").on("keyup", function(event) {
        if (event.keyCode === 13) {
            $("#add-new-product").click();
        }
    });

    $("#add-new-product").on("click", function(event) {
        var $name = $("#product_name");
        var name = sanitize($name.val().trim());
        var $quantity = $("#product_quantity");
        var quantity = parseInt(sanitize($quantity.val().trim()), 10) || 1;
        var $this = $(this);

        $name.removeClass("invalid");

        if (name) {
            $this.attr("disabled", true);

            $.ajax({
                url: "/lists/" + $this.attr("data-list-id") + "/products/new/" + name + "/" + quantity,
                type: "PUT",
                success: function() {
                    window.location.reload();
                },
                error: function(error) {
                    if (error.status === 409) {
                        window.TODO.notify("A task with such name already exists.");
                        $name.addClass("invalid");
                        $this.attr("disabled", false);
                    }
                }
            });
        } else {
            $name.addClass("invalid");
        }

        event.preventDefault();
        return false;
    });

    $("#reopen-list").on("click", function(event) {
        var $this = $(this);

        $this.attr("disabled", true);

        $.ajax({
            url: "/lists/" + $this.attr("data-list-id") + "/reopen",
            type: "POST",
            success: function() {
                window.location.reload();
            },
            error: function(error) {
                console.error(error);
            }
        });

        event.preventDefault();
        return false;
    });
}(window.jQuery));