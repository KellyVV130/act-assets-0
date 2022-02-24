Rails.application.routes.draw do
  get 'welcome/index'  # 与controller中的action对应
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :equipments
  root 'welcome#index' # 将根页面映射到controller中的action
end
