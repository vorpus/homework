# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base
  validates :title, :subs, :author, presence: true
  validate :has_one_sub

  belongs_to :author,
    class_name: :User,
    foreign_key: :author_id

  has_many :post_subs

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments

  has_many :votes, as: :votable

  def has_one_sub
    if self.subs.empty?
      self.errors[:subs] << "Need at least one sub"
    end
  end

  def comments_by_parent_id
    comment_map = Hash.new { |h,k| h[k] = [] }
    comments.includes(:user).map do |comment|
      comment_map[comment.parent_comment_id] << comment
    end
    comment_map
  end

  def score
    votes.select("SUM(value)").pluck("SUM(value)")
  end

end
