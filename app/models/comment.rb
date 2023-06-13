class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  # Busca todos os comentários que estão respondendo a este model, deixando-os numa única 'thread'
  def replies
    Comment.where(['replying_to_comment = ?', self.id])
  end

  # Busca o nome do usuário 'dono' do comentário ao qual este modelo está respondendo
  # Montaremos uma pequena frase quando responder a alguém dentro de uma 'thread', 
  # escrevendo "Responde @username:" e o resto do comentário se segue.
  def getUserReply
    user = User.find(self.replying_to_user)
    username = user.name
    if !username 
      username = "__"
    end
    "@#{username}"
  end
end
