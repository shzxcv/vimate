module ApplicationHelper
  def default_meta_tags
    {
      site: 'Vimate',
      title: 'トップページ',
      reverse: false,
      charset: 'utf-8',
      description: 'VimateはVimに特化した学習サイトです。ゲーム形式でVimを学び、Vimmerへの道を歩みましょう。',
      keywords: 'Vimate, Vim, プログラミング, Vimmer, vim宛',
      canonical: request.original_url,
      separator: '|',
      # 暫定版
      icon: [
        { href: asset_pack_url('media/images/favicon.ico') },
        { href: asset_pack_url('media/images/apple-touch-icon.png'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        # 暫定版
        image: asset_pack_url('media/images/apple-touch-icon.png'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
         # 暫定版
        image: asset_pack_url('media/images/apple-touch-icon.png'),
      }
    }
  end
end
