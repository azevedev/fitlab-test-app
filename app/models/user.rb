class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts
  has_many :comments
  has_many :votes

  # Checa se o usuário é dono de um determinado comentário/post
  def owns?(model)
    model.user_id == self.id
  end

  # Funções auxiliares para checagem de upvotes/downvotes de posts

  # Retorna um auxiliar para desabilitar ou não o botão de posts
  def voted?(post)
    set_votes(post)
    [upvoted?, downvoted?]
  end

  # Checa se se existe voto UP do usuário para o post específico.
  # Se existir, retorna o auxiliar para a view
  def upvoted?
    @votes.where('operation' => 'upvote').exists? ? 'disabled' : ''
  end

  # Checa se se existe voto DOWN do usuário para o post específico.
  # Se existir, retorna o auxiliar para a view
  def downvoted?
    @votes.where('operation' => 'downvote').exists? ? 'disabled' : ''
  end

  # Coloca em instance_var os votos disponíveis do usuário e post especificado.
  def set_votes(post)
    @votes = Vote.where("user_id" => self.id).where("post_id" => post.id)
  end
end
