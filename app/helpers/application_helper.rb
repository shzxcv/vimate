module ApplicationHelper
  def default_meta_tags
    {
      site: 'Vimate',
      title: '',
      reverse: false,
      charset: 'utf-8',
      description: 'VimateはVimに特化した学習サイトです。ゲーム形式でVimを学び、Vimmerへの道を歩みましょう。',
      keywords: 'vimate, vimatejp, vim 勉強, vim ゲーム, vimmer',
      canonical: request.original_url,
      separator: '|',
      # 暫定版
      icon: [
        { href: asset_pack_url('media/images/favicon.ico') },
        { href: asset_pack_url('media/images/ogp_apple_touch_icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: 'Vimate',
        description: :description,
        type: 'website',
        url: request.original_url,
        # 暫定版
        image: asset_pack_url('media/images/ogp_twitter_card.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
         # 暫定版
        image: asset_pack_url('media/images/ogp_twitter_card.png'),
      }
    }
  end
end
