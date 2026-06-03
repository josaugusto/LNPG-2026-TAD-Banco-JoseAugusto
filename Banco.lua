local Banco = {}
Banco.__index = Banco

local function verificarNome(nome)
    if nome and #nome >= 3 then
        return nome
    end

    print("Nome invalido!")
    return nil
end

local function verificarCodigo(codigo)
    if codigo and codigo > 0 then
        return codigo
    end

    print("Codigo invalido!")
    return nil
end

function Banco.novo(nome, codigo)
    nome = verificarNome(nome)
    codigo = verificarCodigo(codigo)

    if not nome or not codigo then
        return nil
    end

    local banco = setmetatable({
        nome = nome,
        codigo = codigo,
        contas = {}
    }, Banco)

    return banco
end

function Banco:adicionarConta(conta)
    if not conta then 
        return false
    end

    if self:buscarConta(conta.numero) then
        print("Ja existe uma conta com esse numero")
        return false
    end

    if conta.banco ~= nil then
        print("Conta ja pertence a um banco")
        return false
    end

    conta.banco = self.nome
    table.insert(self.contas, conta)

    return true
end

function Banco:removerConta(numero)
    for i, conta in ipairs(self.contas) do
        if conta.numero == numero then
            table.remove(self.contas, i)
            return true
        end
    end
end

function Banco:buscarConta(numero)
    for i, conta in ipairs(self.contas) do
        if conta.numero == numero then
           return conta
        end
    end
    return nil
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
    banco = nil
}

if banco then
    print(banco:adicionarConta(conta))
    print(banco:quantidadeContas())

    local contaEncontrada = banco:buscarConta(10)

    if contaEncontrada then
        print(contaEncontrada.numero)
        print(contaEncontrada.saldo)
        print(contaEncontrada.titular)
        print(contaEncontrada.banco)
    end
end

return banco