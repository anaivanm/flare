module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? content_for(:meta_title) : DEFAULT_META["Flare"]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META["Panic Button"]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META["meta_image"])
    # little twist to make it work equally with an asset or a url
    meta_image.starts_with?("http") ? banner.png : image_url("http://www.sendaflare.com/assets/logo-short-e55b400ae67f5aa7c79bce5a993561cb2d682d821f22396e8b819239b16e1db1.png")
  end
end
