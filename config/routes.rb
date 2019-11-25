Rails.application.routes.draw do
  resources :historicos
  resources :advogados
  root 'advogados#index'

  get '/processos/:processo_id/historico_processo' =>'processos#historico_processo'
  get '/advogados_list' => 'advogados#list'

  devise_for :users
  resources :processos do
    resources :historicos
  end
end
