class ProdutosController < ApplicationController

    def index
        @produtos = Produto.order :nome
    end

    def new
        @produto = Produto.new
        @departamentos = Departamento.all
    end

    def create
        valores = params.require(:produto).permit(:nome, :descricao, :departamento_id, :preco, :quantidade)
        @produto = Produto.new valores
        @departamentos = Departamento.all
        if @produto.save
            flash[:notice] = "Produto salvo com sucesso!"
            redirect_to root_path
        else
            render :new
        end
    end

    def destroy
        id = params[:id]
        Produto.destroy id
        redirect_to root_url
    end

    def busca
        @nome = params[:nome]
        @produtos = Produto.where "nome like ?",  "%#{@nome}%"
    end

end
