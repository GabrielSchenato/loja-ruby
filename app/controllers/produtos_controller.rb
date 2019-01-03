class ProdutosController < ApplicationController

    def index
        @produtos = Produto.order :nome
    end

    def create
        produto = params.require(:produto).permit(:nome, :descricao, :preco, :quantidade)
        Produto.create produto
        redirect_to root_path
    end

    def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
    end

end
