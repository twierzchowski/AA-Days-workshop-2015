TodoList::Application.routes.draw do
  root to: 'lists#index'

  get 'lists/index'
  get 'lists/:id', to: 'list#view'

  delete 'lists/:id', to: 'lists#delete_list'
  put 'lists/new/:name', to: 'lists#new_list'

  delete 'lists/:id/products/:productId', to: 'list#delete_product'
  put 'lists/:id/products/new/:title/:quantity', to: 'list#new_product'

  post 'lists/:id/products/:productId/toggle', to: "list#toggle_product"
  post 'lists/:id/reopen', to: "list#reopen_list"

  get 'users/login'
  get 'users/logout'

  post 'users/authenticate'
end