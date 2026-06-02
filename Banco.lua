local Banco = {}
Banco.__index = Banco

function Banco.novo(nome, codigo)
    local function verificarNome(nome)
        if #nome >= 4 then
            return nome
        else 
            print("Nome invalido")
        end 
    end

    local function verificarCodigo(codigo)
        if codigo > 0 then
            return codigo
        else
            print("Codigo invalido")
        end
    end

    local banco = setmetatable({
        nome = verificarNome(nome),
        codigo = verificarCodigo(codigo),
        contas = {}
    }, Banco)

    return banco
end

function Banco:adicionarConta(conta)
    table.insert(self.contas, conta)
end

function Banco:removerConta(numero)
    for i, conta in ipairs(self.contas) do
        if conta.numero == numero then
            table.remove(self.contas, i)
        end
    end
end

function Banco:buscarConta(numero)
    for i, conta in ipairs(self.contas) do
        if conta.numero == numero then
            print("Numero: " .. conta.numero)
            print("Saldo: R$" .. conta.saldo)
            print("Titular: " .. conta.titular)
            print("Banco: " .. conta.banco)
        end
    end
end

function Banco:quantidadeContas()
    return #self.contas
end

function Banco:listarContas()
    for i, conta in ipairs(self.contas) do
        print("Numero: " .. conta.numero)
        print("Saldo: R$" .. conta.saldo)
        print("Titular: " .. conta.titular)
        print("Banco: " .. conta.banco)
        print("------------------------")
    end
end

local banco = Banco.novo("Master", 5)

local conta = {
    numero = 10,
    saldo = 10000,
    titular = "Augusto",
    banco = "Master"
}

banco:adicionarConta(conta)

print(banco:quantidadeContas())
-- banco:removerConta(10)
print(banco:quantidadeContas())
print(banco:buscarConta(10))
-- print(banco:listarContas())

return banco