module ApplicationHelper
  def default_meta_tags
    {
      site: 'VIMATE',
      title: 'Vim特化学習サイト',
      reverse: true,
      charset: 'utf-8',
      description: 'VIMATEはVimに特化した学習サイトです。ゲーム形式でコマンドの使い方を学び、Vimmerへの道を歩みましょう。',
      keywords: 'vimate, vim コマンド, vim 使い方, vim ゲーム, vimmer',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: asset_pack_url('media/images/favicon.ico') },
        { href: asset_pack_url('media/images/ogp_apple_touch_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: 'VIMATE',
        description: :description,
        type: 'website',
        url: request.original_url,
        image: asset_pack_url('media/images/ogp_twitter_card.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        image: asset_pack_url('media/images/ogp_twitter_card.png'),
      }
    }
  end
end
