class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy upvote downvote ]
  before_action :authenticate_user!
  before_action :check_owner, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post foi criado com sucesso." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to post_url(@post), notice: "Post foi editado com sucesso." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post foi deletado com sucesso." }
      format.json { head :no_content }
    end
  end

  # POST /posts/1/upvote
  # Cuida da lógica para escolher UPVOTE em um post
  def upvote
    #Adiciona o voto UP ao total
    @post.up_votes += 1
    # Busca possível voto DOWN já existente
    @past_vote = Vote.where("user_id" => current_user.id, "post_id" => @post.id, "operation" => "downvote").first
    # Caso voto DOWN realmente exista, remova-o do total de votos do Post e também da tabela de Votos.
    if @past_vote
      @post.down_votes -= 1
      @past_vote.destroy
    end
    # Criando noto Voto UP para ser colocado na tabela de Votos.
    @vote = Vote.new("user_id" => current_user.id, "post_id" => @post.id, "operation" => "upvote")
    if @post.save && @vote.save
      redirect_to posts_path, notice: "Upvote atualizado!"
    else
      redirect_to posts_path, notice: "Upvote não recebido..."
    end
  end

  # POST /posts/1/downvote
  # Cuida da lógica para escolher DOWNVOTE em um post
  def downvote
    # Adiciona o voto DOWN ao total
    @post.down_votes += 1
    # Busca possível voto UP já existente
    @past_vote = Vote.where("user_id" => current_user.id, "post_id" => @post.id, "operation" => "upvote").first
    # Caso voto UP realmente exista, remova-o do total de votos do Post e também da tabela de Votos.
    if @past_vote
      @post.up_votes -= 1
      @past_vote.destroy
    end
    # Criando noto Voto DOWN para ser colocado na tabela de Votos.
    @vote = Vote.new("user_id" => current_user.id, "post_id" => @post.id, "operation" => "downvote")
    if @post.save && @vote.save
      redirect_to posts_path, notice: "Downvote atualizado!"
    else
      redirect_to posts_path, notice: "Downvote não recebido..."
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Ajuda na checagem de 'owner' de um Post
    def check_owner
      if @post.user.id != current_user.id 
        flash[:notice] = 'Você não possui acesso à esse recurso.'
        redirect_to posts_path
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :category, :body, :user_id)
    end
end
