local indiceJogada = 1;
local jogadasFeitas = {{}, {}, {}, {}, {}, {}, {}, {}, {}};
local TAMANHO_CAIXA = 102;
local TAMANHO_X_O = TAMANHO_CAIXA / 3;

local function verificaFim ()
    if (jogadasFeitas[1] and jogadasFeitas[1] == jogadasFeitas[2]
            and jogadasFeitas[2] == jogadasFeitas[3]) then
        return jogadasFeitas[1];
    elseif (jogadasFeitas[4] and jogadasFeitas[4] == jogadasFeitas[5]
            and jogadasFeitas[5] == jogadasFeitas[6]) then
        return jogadasFeitas[4];
    elseif (jogadasFeitas[7] and jogadasFeitas[7] == jogadasFeitas[8]
            and jogadasFeitas[8] == jogadasFeitas[9]) then
        return jogadasFeitas[7];
    elseif (jogadasFeitas[1] and jogadasFeitas[1] == jogadasFeitas[4]
            and jogadasFeitas[4] == jogadasFeitas[7]) then
        return jogadasFeitas[1];
    elseif (jogadasFeitas[2] and jogadasFeitas[2] == jogadasFeitas[5]
            and jogadasFeitas[5] == jogadasFeitas[8]) then
        return jogadasFeitas[2];
    elseif (jogadasFeitas[3] and jogadasFeitas[3] == jogadasFeitas[6]
            and jogadasFeitas[6] == jogadasFeitas[9]) then
        return jogadasFeitas[3];
    elseif (jogadasFeitas[1] and jogadasFeitas[1] == jogadasFeitas[5]
            and jogadasFeitas[5] == jogadasFeitas[9]) then
        return jogadasFeitas[1];
    elseif (jogadasFeitas[3] and jogadasFeitas[3] == jogadasFeitas[5]
            and jogadasFeitas[5] == jogadasFeitas[7]) then
        return jogadasFeitas[3];
    end
end

local ceil, floor = math.ceil, math.floor

local function fazJogada (self, event)
	local caixa = jogadasFeitas[self.id];
	local jogada = ceil(indiceJogada / 2);
	-- Se é primeira ou segunda jogada
    if (indiceJogada % 2 == 1) then
		caixa[jogada] = true;
		-- o `-1` serve pra transformar [0, 2] em [-1, 1]
		local x, y = (jogada - 1) % 3 - 1, floor((jogada - 1) / 3) - 1
		print(indiceJogada, x, y, jogada)
		display.newText{parent=self, text=jogada, x=x * TAMANHO_X_O, y=y * TAMANHO_X_O}
		indiceJogada = indiceJogada + 1;
	else
		indiceJogada = indiceJogada + 1;
	end
--[[        jogadasFeitas[self.id] = "X";
        indiceJogada = indiceJogada + 1;
        display.newImageRect(self, "X.png", 102, 102);
    elseif (not jogadasFeitas[self.id] and indiceJogada % 2 == 0) then
        jogadasFeitas[self.id] = "O";
        indiceJogada = indiceJogada + 1;
        display.newImageRect(self, "O.png", 102, 102);
    end
    local resultadoRodada = verificaFim();
    if (resultadoRodada == "X") then
        native.showAlert("Parabéns, você ganhou", "X", {'OK'});
    elseif (resultadoRodada == "O") then
        native.showAlert("Parabéns, você ganhou", "O", {'OK'});
    elseif (indiceJogada == 10) then
        native.showAlert("Deu véia", "AFF", {'OK'});
    end
--]]
end


local Tabuleiro = display.newGroup();
Tabuleiro.x = display.contentCenterX;
Tabuleiro.y = display.contentCenterY;

for i = 1, 3 do
    for j = 1, 3 do
        local nova_caixa = display.newGroup();
        Tabuleiro:insert(nova_caixa);
        display.newImageRect(nova_caixa, "caixa.png", TAMANHO_CAIXA, TAMANHO_CAIXA);
        nova_caixa.x = ((j - 2) * TAMANHO_CAIXA);
        nova_caixa.y = ((i - 2) * TAMANHO_CAIXA);
        nova_caixa.id = (3 * (i - 1)) + j;
        nova_caixa.tap = fazJogada;
        nova_caixa:addEventListener("tap", nova_caixa);
    end
end


