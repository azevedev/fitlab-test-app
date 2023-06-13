class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :votes
  
  # Busca os comentário que não respondem outros comentários, somente estão em um certo Post.
  # Esses comentários serão usados para criar as 'threads' de comentários numa postagem.
  def unique_comments
    self.comments.where('replying_to_comment' => nil)
  end
end
