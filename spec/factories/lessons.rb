FactoryBot.define do
  factory :lesson do
    name { '初級編' }
    description { 'vimを学ぼう' }
    category { 'Vim' }
    url { 'vim-01' }
  end
end
