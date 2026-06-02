require "Cliente"
require "Banco"

local ContaBancaria = {}
ContaBancaria.__index = ContaBancaria

function ContaBancaria.nova(numero, saldo, titular, banco)
    local function verificarNumero(numero)
        if numero > 0 then
            return numero
        else 
            print("Numero invalido!")
        end
    end

    local function verificarTitular(cliente, titular)
        for i, cliente in ipairs(cliente) do
            
        end
    end

    local function verificarBanco(banco)
        
    end

    local function verificarSaldo(saldo)
        if saldo > 0 then
            return saldo
        else 
            return 0
        end
    end

end