class Produto < ApplicationRecord

    validates :nome, length: {  minimum: 4  }
    validates :preco, presence: true
    validates :descricao, length: { in: 5..200 }
    validates :quantidade, numericality: { only_integer: true }

end
