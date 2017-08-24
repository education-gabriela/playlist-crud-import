class Comment < ApplicationRecord
  belongs_to :commentable, :polymorphic => true
  has_many :comments, :as => :commentable
  belongs_to :user

  def playlist
    return @playlist if defined?(@playlist)
    @playlist = commentable.is_a?(Playlist) ? commentable : commentable.playlist
  end
  
end
