local indiceJogada = 1;
local jogadasFeitas = {};

local function fazJogada (self, event)
    if (not jogadasFeitas[self.id] and indiceJogada % 2 == 1) then
        jogadasFeitas[self.id] = "X";
        indiceJogada = indiceJogada + 1;
        display.newImageRect(self, "X.png", 102, 102);
    elseif (not jogadasFeitas[self.id] and indiceJogada % 2 == 0) then
        jogadasFeitas[self.id] = "O";
        indiceJogada = indiceJogada + 1;
        display.newImageRect(self, "O.png", 102, 102);
    end
end


local caixa = {};
local Tabuleiro = display.newGroup();
Tabuleiro.x = display.contentCenterX;
Tabuleiro.y = display.contentCenterY;

for i = 1, 3 do
    caixa[i] = {};
    for j = 1, 3 do
        local nova_caixa = display.newGroup();
        Tabuleiro:insert(nova_caixa);
        display.newImageRect(nova_caixa, "caixa.png", 102, 102);
        nova_caixa.x = ((j - 2) * 102);
        nova_caixa.y = ((i - 2) * 102);
        nova_caixa.id = (3 * (i - 1)) + j;
        nova_caixa.tap = fazJogada;
        nova_caixa:addEventListener("tap", nova_caixa);
    end
end


