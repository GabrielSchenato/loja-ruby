class ProdutosController < ApplicationController

    before_action :set_produto, only: [:edit, :update, :destroy]

    def index
        @produtos = Produto.order :nome
    end

    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end

    def edit
        @departamentos = Departamento.all
        render :new
    end

    def update
        @departamentos = Departamento.all
        if @produto.update produto_params
            flash[:notice] = "Produto editado com sucesso!"
            redirect_to root_path
        else
            render :new
        end
    end

    def create
        @produto = Produto.new produto_params
        @departamentos = Departamento.all
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        @produto.destroy
        redirect_to root_url
    end

    def busca
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?",  "%#{@nome}%"
    end

    private
    def produto_params
        params.require(:produto).permit(:nome, :descricao, :departamento_id, :preco, :quantidade)
    end

    def set_produto
        @produto = Produto.find(params[:id])
    end

end
