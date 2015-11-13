class ShoppingListPage < BasePage
#Zadanie GUI_3:
# TODO: W tej klasie coś jest nie tak. Odpal testy za pomocą 'RUN_GUI_TESTS.bat'
#       i przeanalizuj komunikaty błędów.

  include Ajax

  def initialize(session)
    super(session)
  end

  def selectCheckBoxNearName(name)
    @session.find(
      :xpath,
      "/html/body/section/ul/li/span[contains(text(), '#{name}')]/preceding-sibling::label"
    )
  end

  def mapNameToSelector(name)
    case name
      when 'new product name'
        '#product_name'

      when 'new product quantity'
        '#product_quantity'

      when 'add button'
        '#add-new-product'

      when 'product name'
        '#task-list__task__title'

      when 'product quantity'
        '#task-list__task__quantity'

      else
        fail("There is no '#{name}' in the ShoppingListPage object mapping definition!")
    end
  end

  def checkNear(name)
    selectCheckBoxNearName(name).click
  end

end