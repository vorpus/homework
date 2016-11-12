# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  content           :text             not null
#  author_id         :integer          not null
#  post_id           :integer          not null
#  parent_comment_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Comment < ActiveRecord::Base
  validates :content, :user, :post, presence: true

  belongs_to :user,
    foreign_key: :author_id,
    class_name: :User

  belongs_to :post

  has_many :child_comments,
    class_name: :Comment,
    primary_key: :id,
    foreign_key: :parent_comment_id

  has_many :votes, as: :votable

  def score
    votes.select("SUM(value)").pluck("SUM(value)")
  end
end
