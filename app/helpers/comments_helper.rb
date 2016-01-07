# == Schema Information
#
# Table name: comments
#
#  id              :integer          not null, primary key
#  conversation_id :integer
#  user_id         :integer
#  body            :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  favorites_count :integer          default(0), not null
#

module CommentsHelper
  def markdownify(content)
    pipeline_context = { gfm: true, asset_root: "https://a248.e.akamai.net/assets.github.com/images/icons" }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::EmojiFilter,
      HTML::Pipeline::SanitizationFilter,
    ], pipeline_context
    pipeline.call(content)[:output].to_s.html_safe
  end
end
