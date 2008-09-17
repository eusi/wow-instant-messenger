--[[
    Stewmat is a format dedicated to Stewarta
]]

-- imports
local WIM = WIM;
local _G = _G;
local string = string;
local math = math;
local bit = bit;
local type = type;
local pairs = pairs;
local unpack = unpack;
local tostring = tostring;
local table = table;
local CreateFrame = CreateFrame;

-- set namespace
setfenv(1, WIM);



function createCanvas()
    local canvas = CreateFrame("Frame");
    canvas:SetWidth(64); canvas:SetHeight(64);
    canvas.pixels = {};
    for i = 1, 64*64 do
        local pixel = canvas:CreateTexture(nil, "OVERLAY");
        pixel:SetWidth(1); pixel:SetHeight(1);
        pixel:SetTexture(i%2, i%2, i%2); -- test
        if(#canvas.pixels == 0) then
            pixel:SetPoint("TOPLEFT");
        else
            if(i%64 == 1) then
                pixel:SetPoint("TOPLEFT", canvas.pixels[#canvas.pixels-63], "BOTTOMLEFT");
            else
                pixel:SetPoint("TOPLEFT", canvas.pixels[#canvas.pixels], "TOPRIGHT");
            end
        end
        table.insert(canvas.pixels, pixel);
    end
    canvas.Clear = function(self)
        for i=1, #self.pixels do
            self.pixels[i]:SetTexture(nil);
        end
    end
    canvas.LoadImage = function(self, img)
        img = string.trim(img);
        self:Clear();
        local count = 0;
        for color in string.gmatch(img, "[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]") do
            count = count + 1;
            self.pixels[count]:SetTexture(RGBHexToPercent(color));
        end
        dPrint(count.." points laoded.");
    end
    canvas:SetPoint("CENTER");
    return canvas;
end


function _G.test()
    local img = "98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c98746c7c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c60587c605868504868504868504868504868504868504868504868504868504868504868504868504868504868504868504868504868504868504850343498746c4028284028284028284028282818142818142818144028284028280c08040c08043c302c3c302c3c302c0c08043c302c3c302c3c302c3c302c3c302c5034345034346850485034346850485034346850487c60586850487c60586850486850486850484028282818142818140400000400000400000400000400000400000400004028285034346850485034347c60586850485034346850487c60586850487c605850343468504868504850343468504868504850343468504840282898746c4028285034344028282818144028282818144028280c08043c302c3c302c50483c6c64586c64586c64586c64586c64586c645850483c50483c3c302c3c302c3c302c50343468504898746c5034346850487c60585034347c605898746c7c60586850484028282818142818140400000400000400000400000400000400000400000400004028285034347c60585034347c60586850485034346850487c605898746c68504850343468504850343468504868504850343450343440282898746c4028284028284028284028282818144028280c08043c302c50483c6c6458847c6c847c6c847c6c847c6c847c6c847c6c847c6c6c64586c64586c645850483c50483c3c302c3c302c7c605868504850343498746c6850487c60587c605868504868504850343428181428181404000004000004000004000004000004000004000004000004000040282868504868504868504850343468504898746c6850487c60585034346850485034346850485034346850487c605850343440282898746c5034344028284028285034342818140c080450483c6c6458847c6ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8c847c6c847c6c6c645850483c50483c3c302c5034346850487c60586850487c60586850487c60586850485034342818142818140400000400000400000400000400000400000400000400000400000400005034346850485034344028286850487c60585034346850487c60585034346850485034346850487c605868504850343440282898746c4028284028285034344028280c080450483c6c6458847c6ca49c8ca49c8cd0c0b4d0c0b4d0c0b4d0c0b4d0c0b4d0c0b4d0c0b4d0c0b4a49c8ca49c8ca49c8c847c6c847c6c6c645850483c3c302c5034347c60587c60587c60585034346850486850485034342818142818140400000400000400000400000400000400000400000400000400000400000400005034346850485034347c60585034347c605868504898746c7c60585034346850487c605898746c50343450343440282898746c4028285034344028280c080450483c6c6458847c6ca49c8cfffff4d0c0b4fffff4d0c0b4fffff4d0c0b4fffff4fffff4fffff4d0c0b4d0c0b4d0c0b4a49c8ca49c8c847c6c847c6c6c645850483c3c302c7c60587c605868504868504898746c5034345034342818142818140400000400000400000400000400000400000400000400000400000400000400000400005034346850486850485034347c60585034347c60587c605850343450343468504850343468504868504840282898746c4028284028284028280c08046c64586c645850483c50483cd0c0b4fffff4fffff4fffff4fffff4fffff4fffff4d0c0b4d0c0b4a49c8c6c64586c64586c6458a49c8ca49c8c847c6c847c6c6c64580c08043c302c7c60587c60585034347c60586850485034342818142818140400000400000400000400000400000400000400000400000400000400000400000400000400005034346850487c60586850485034347c60586850485034346850486850487c605850343450343440282898746c4028284028280c080450483c50483c3c302c3c302c3c302c6c6458d0c0b4fffff4fffff4fffff4fffff4d0c0b4d0c0b46c645850483c3c302c3c302c50483c6c6458a49c8c847c6c847c6c6c645850483c3c302c6850486850485034347c60585034344028282818142818140400000400000400000400000400000400000400000400000400000400000400000400000400002818145034345034346850485034346850486850485034347c605868504850343450343468504840282898746c5034344028280c080450483c3c302c0c08040000000c08043c302cfffff4d0c0b4fffff4d0c0b4d0c0b4d0c0b46c64583c302c0c08040000000c08040c08043c302c6c6458a49c8c847c6c847c6c6c64580c08043c302c7c60585034346850486850484028282818142818140400000400000400000400000400000400000400000400000400000400000400000400000400000400004028285034346850486850485034345034345034345034346850487c605868504850343440282898746c4028280c080450483c3c302c0c08040000000c08040000000c0804d0c0b4fffff4d0c0b4fffff4d0c0b46c64583c302c0c08040000000c08040000000c08040c080450483ca49c8ca49c8c847c6c6c645850483c3c302c6850486850485034346850484028282818142818140400000400000400000400000400000400000400000400000400000400000400000400000400000400002818145034346850485034346850485034345034346850486850487c60587c605868504840282898746c4028280c080450483c0c08040000000c08040000000c08040c0804fffff4d0c0b4fffff4d0c0b4d0c0b450483c0c08040000000c08040000000c08040000000c08043c302cd0c0b4a49c8c847c6c6c64586c64580c08046850485034346850485034342818142818142818140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400002818145034346850485034347c60587c605850343450343498746c68504868504840282898746c3c302c3c302c3c302c0000000c08040000000000000000003c302cd0c0b4d0c0b4d0c0b4d0c0b4d0c0b43c302c0000000c08040000000000000000000000000000003c302cd0c0b4a49c8c847c6c847c6c6c64583c302c3c302c6850485034345034342818142818140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028285034345034347c60587c60586850485034347c60587c605868504840282898746c0c080450483c3c302c0c08040000000000000000000c08046c6458d0c0b4d0c0b4d0c0b4d0c0b4d0c0b43c302c0c08040000000000000000000000000000000c08043c302cd0c0b4a49c8c847c6c6c64586c64583c302c0c080450343468504840282828181428181404000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000028181450343450343498746c7c60586850484028287c605868504868504840282898746c0c080450483c3c302c0c08040000000000000c08043c302cd0c0b4d0c0b4d0c0b4d0c0b4d0c0b4a49c8c3c302c0000000c08040000000000000000000000000000006c6458d0c0b4a49c8c847c6c847c6c6c645850483c0c08046850485034344028282818140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028285034347c605868504850343468504850343468504868504840282898746c0c080450483c50483c3c302c0c08040c08043c302c847c6ca49c8cd0c0b4d0c0b4d0c0b4a49c8cd0c0b43c302c0c08040000000000000000000000000000000c0804847c6ca49c8ca49c8c847c6c6c64586c645850483c0c08046850485034342818142818140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400002818145034347c605868504850343468504868504868504850343440282898746c0c080450483c6c645850483c50483c50483c6c6458a49c8cd0c0b4a49c8cd0c0b4d0c0b4a49c8ca49c8c6c64583c302c0c08040000000c08040c08043c302c6c6458d0c0b4a49c8c847c6c6c6458847c6c6c645850483c0c080450343428181428181404000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000028181468504850343468504850343468504850343450343440282898746c0c080450483c6c64586c645850483c6c64586c6458d0c0b450483ca49c8c50483cd0c0b4a49c8ca49c8c6c64586c64583c302c3c302c3c302c3c302c847c6cd0c0b4a49c8ca49c8c847c6c847c6c6c64586c645850483c0c080450343428181404000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000028181450343440282850343468504868504868504850343440282898746c0c080450483c6c64586c64586c64586c6458a49c8c6c645850483ca49c8c50483c6c6458d0c0b4a49c8ca49c8c847c6ca49c8ca49c8cd0c0b4d0c0b4d0c0b4a49c8ca49c8c847c6c847c6c6c6458847c6c6c64583c302c0c08042818140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400002818145034344028285034346850487c605868504840282898746c0c08043c302c6c64586c64586c6458847c6c847c6ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8c847c6c847c6c847c6ca49c8c847c6ca49c8c847c6c847c6c6c6458847c6c6c645850483c3c302c0000000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028285034345034346850487c605868504840282898746c4028280c080450483c6c6458847c6c6c6458847c6c847c6ca49c8c847c6ca49c8c847c6ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8ca49c8c847c6ca49c8c847c6c847c6c6c6458847c6c6c64586c645850483c0c08040400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400002818144028285034346850485034347c605840282898746c4028280c08043c302c6c64586c6458847c6c6c6458847c6c847c6ca49c8c847c6ca49c8c847c6ca49c8c847c6ca49c8c847c6ca49c8c847c6ca49c8c847c6c847c6c6c6458847c6c6c64586c645850483c3c302c0000000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400002818145034346850486850487c605840282898746c4028284028280c080450483c6c64586c6458847c6c6c6458847c6c847c6c847c6c847c6ca49c8c847c6ca49c8c847c6ca49c8c847c6ca49c8c847c6c847c6c6c6458847c6c6c64586c645850483c3c302c0c080404000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000028181450343468504850343440282898746c4028284028280c08043c302c50483c6c64586c6458847c6c6c6458847c6c847c6c847c6c847c6c847c6c847c6c847c6c847c6c847c6c847c6c847c6c6c6458847c6c6c64586c645850483c3c302c0c080404000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000028181450343450343440282898746c2818144028284028280c08043c302c50483c6c64586c6458847c6c6c64583c302c3c302c6c64586c6458847c6c6c6458847c6c6c6458847c6c6c6458847c6c6c64586c645850483c3c302c0c080404000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000028181450343440282898746c5034342818145034344028280c08043c302c50483c6c64586c64586c64580c08040c08046c6458847c6c6c6458847c6c6c6458847c6c6c64586c64586c64586c645850483c3c302c0c080404000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000004000028181440282898746c2818144028282818144028284028280c08040c08043c302c50483c50483c6c64586c64586c64586c64586c64586c64586c64586c64586c64586c645850483c3c302c3c302c0c08040400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400001814141814142c24242c24242c24242c24242c24241814141814140000000400000400000400000400000400000400000400000400000400000400000400000400004028287c60584028282818144028284028284028286850484028280c08040c08043c302c3c302c50483c50483c50483c50483c50483c50483c50483c3c302c3c302c3c302c0c08040000000400000400000400000400000400000400000400000400000400000400000400000400001814141814141814142c242438303048443c58544c48443c3830302c24241814141814140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028287c60584028284028286850485034345034344028284028282818144028284028280c08040c08040c08040c08040c08040c08040c08040c08040c08040c08040c08040c08040400000400000400000400000400000400000400000400000400000400001814141814141814142c242438303048443c58544c48443c3830302c24241814141814141814140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028287c605848443c3830303830303830304028284028284028284028282818144028284028285034344028284028284028284028280c080450483c50483c50483c50483c3c302c0400000400000400000400000400000400000400000400001814141814142c242438303048443c58544c84787448443c3830302c24240400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028287c605838303048443c6c686058544c3830303830303830304028282818144028285034344028285034344028285034345034343c302c6c6458847c6c847c6c6c645850483c0400000400000400000400000400001814141814141814142c242438303048443c58544c84787448443c3830302c24240400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028287c60581814142c242438303048443c58544c6c686048443c48443c38303038303040282850343440282850343450343450343448443c50483c847c6ca49c8c847c6c50483c1814141814141814141814141814142c242438303038303048443c58544c48443c48443c3830302c24241814141814141814141814141814141814140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400004028287c60584028281814142c242438303038303048443c48443c8478746c686048443c48443c5034344028285034342c24242c24243830300c0804847c6ca49c8c847c6c1814142c242448443c2c24242c242438303038303048443c58544c6c68608478746c686058544c6c686084787458544c48443c48443c48443c3830302c24241814141814141814140400000400000400000400000400000400000400000400000400000400000400000400000400000400000400000400001814144028287c60584028284028281814141814142c242438303038303048443c48443c58544c58544c48443c48443c48443c2c242448443c2c24242c24241814146c64581814142c242448443c3830302c242438303048443c58544c8478746c686058544c6c686048443c48443c48443c38303038303038303038303038303048443c38303048443c3830302c24241814141814141814140400000400000400000400000400000400000400000400000400000400002818143c302c3c302c1814142c24247c60584028284028284028281814141814141814142c242458544c38303048443c84787458544c6c686058544c2c242438303048443c3830302c24242c24242c242438303038303048443c2c242448443c38303048443c48443c48443c48443c84787458544c6c686058544c48443c3830302c24242c24242c24242c24242c24242c24242c24242c24242c24242c24242c24241814140400000400000400000400000400000400000400000400002818143c302c50483c50483c3c302c2c24247c60581814141814142c242438303048443c8478746c686058544c58544c48443c58544c6c686058544c8478742c242448443c38303048443c38303048443c48443c38303048443c2c242418141438303048443c38303048443c48443c48443c48443c48443c48443c48443c84787458544c58544c2c24241814141814141814141814141814141814141814141814142c24242c24241814140400000400000400000400000400002818142818143c302c50483cd0c0b4847c6cfffff43c302c7c605838303048443c58544c84787448443c38303038303038303038303038303058544c84787448443c48443c2c24242c24243830303830306c68606c68606c68602c24241814142c24241814142c24242c24242c24242c24242c24242c24242c242438303038303048443c48443c48443c48443c84787448443c3830301814140400000400000400000400000400001814141814141814141814140400000400000400002818143c302c50483c50483c50483c3c302c50483ca49c8c3c302c7c605858544c3830303830303830302c24242c24242c242418141418141484787448443c48443c48443c3830303830302c24242c24241814142c24246c686048443c1814142c24242c24241814142c24242c24241814142c24241814142c24241814142c24241814142c24242c242438303038303048443c48443c48443c3830301814140400000400000400000400000400000400000400001814141814140400002818143c302c50483c847c6c50483cd0c0b4fffff450483c3c302c3c302c7c60582c242418141418141418141418141418141418141418141484787448443c48443c3830303830303830302c24241814142c24242c242418141448443c3830303830302c24241814141814142c24242c24242c24242c24242c24241814142c24241814142c24242c24241814142c24242c24242c242438303048443c48443c3830301814140400000400000400000400000400000400000400000400000400002818143c302c847c6c50483cd0c0b4a49c8c847c6cd0c0b46c64583c302c7c605818141440282840282840282840282818141438303058544c48443c3830303830302c24242c24241814140000002c24241814142c242438303048443c48443c3830302c24241814144c443c2c24242c242438303058544c48443c3830301814142c24242c24242c24242c24242c24241814141814141814142c24242c242448443c3830301814140400000400000400002818142818143c302c3c302c3c302c3c302c50483c50483c3c302c3c302c50483c847c6c847c6c50483c4028287c605840282840282840282840282818141438303048443c3830303830302c24241814140000001814141814142c24243830303c34341814142c24242c24242c24242c24241814141814144c443c5c544c2c242458544c48443c3830303830303830301814142c24243830302c24242c24241814140400000400001814141814141814142c24243830301814140400000400002818143c302c847c6cd0c0b4fffff4d0c0b4847c6c3c302c3c302c0c08043c302c50483c50483c847c6c4028287c605828181440282828181418141438303048443c3830302c24241814140000001814142c24241814142c24243830302c24244c443c5c544c1814141814141814141814141814144c443c5c544c6c645838303038303058544c58544c48443c48443c3830301814142c24243830302c24242c24241814140400000400000400000400001814142c24243830301814140400000400000400002818143c302c3c302cd0c0b4d0c0b4847c6c3c302c3c302c0c08043c302c3c302c50483c4028287c605850343428181418141438303048443c2c24241814140000004028281814142c24241814142c242438303048443c2c24246c645880786c5c544c1814141814141814144c443c5c544c80786c6c64585c544c38303048443c38303038303038303048443c3830301814143830303830302c24242c24240400000400000400000400000400001814141814141814140400000400000400000400000400000400003c302c847c6c847c6c3c302c0c08043c302c3c302c0c08044028284028287c605828181418141438303048443c2c24240000001814144028284028281814141814142c242418141448443c58544c3830306c645880786c80786c5c544c5c544c5c544c5c544c80786c80786c6c64585c544c2c242458544c48443c48443c38303038303048443c2c24242c24243830303830302c24241814140400000400000400000400000400001814141814140400000400000400000400000400000400000400002c24242c24242c24244028284028285034345034345034344028287c60582c242438303048443c1814140000002818144028282818144028281814142c242418141448443c58544c3830302c24245c544c80786c80786c80786c80786c80786c80786c9c8c8480786c6c64585c544c2c242448443c38303038303048443c2c24241814142c24242c242448443c3830302c24241814140400000400000400000400000400000400001814140400000400000400000400000400000400000400002c242418141418141440282850343468504850343450343440282868504818141438303018141428181428181440282828181440282840282818141418141438303038303038303048443c3830305c544c80786c9c8c849c8c849c8c849c8c849c8c849c8c8480786c6c64585c544c2c242458544c48443c2c24241814142c242438303048443c48443c38303048443c3830302c24240400000400000400000400000400000400000400000400000400000400000400000400000400001814143830302c24242c24244028285034345034347c60585034344028286850481814141814144028282818142818142818144028285034344028281814142c24243830302c24243830302c24242c24245c544c80786c9c8c84c0b0ac9c8c84c0b0ac9c8c849c8c8480786c6c64585c544c2c242448443c38303018141438303048443c38303058544c38303058544c48443c48443c2c242404000004000004000004000004000004000004000004000004000004000004000004000004000018141484787448443c3830302c24244028285034346850487c60584028286850484028284028284028280400002818144028284028284028285034341814141814141814141814141814141814142c24245c544c6c64589c8c849c8c84c0b0ac9c8c849c8c849c8c8480786c6c64585c544c2c242458544c48443c48443c18141458544c38303038303048443c38303048443c58544c3830301814140400000400000400000400000400000400000400000400000400000400000400000400001814148478746c686048443c3830304028285034345034346850484028286850484028285034344028280400002818142818144028284028285034344028281814142c24241814141814142c24243830305c544c5c544c80786c9c8c849c8c849c8c849c8c8480786c80786c6c64585c544c2c242448443c38303038303048443c18141438303058544c38303038303048443c58544c3830301814140400000400000400000400000400000400000400000400000400000400000400000400002c24248478746c686048443c3830302818145034347c60585034344028286850485034344028284028280400002818144028282818145034344028284028281814141814142c24241814142c242458544c3830305c544c80786c80786c9c8c849c8c8480786c80786c6c64586c64585c544c2c242458544c48443c48443c38303038303018141438303058544c3830302c242458544c48443c2c24240400000400000400000400000400000400000400000400000400000400000400000400002c24248478746c686048443c2c24242818144028285034346850484028286850484028282818144028280400002818142818144028284028284028284028281814142c24241814142c242448443c3830302c24245c544c6c645880786c80786c80786c80786c80786c6c64586c64585c544c38303048443c38303038303048443c3830303830301814143830302c24242c242448443c58544c2c24240400000400000400000400000400000400000400000400000400000400000400000400001814146c686048443c3830301814140400002818145034346850484028286850482818144028282818140400002818144028284028284028285034344028284028281814141814142c24242c242438303058544c3830305c544c80786c80786c80786c80786c6c64586c64585c544c5c544c38303058544c48443c38303038303048443c2c24241814142c24242c242418141438303058544c3830301814140400000400000400000400000400000400000400000400000400000400000400001814142c24242c24242c24241814140400000400004028285034344028286850484028282818144028282818142818144028282818145034345034345034344028281814141814142c24242c242448443c3830302c24245c544c6c64586c64586c64586c64586c64585c544c5c544c4c443c2c242448443c38303048443c3830302c24241814142c24242c24242c242418141438303058544c48443c2c24240400000400000400000400000400000400000400000400000400000400000400001814143830303830301814140400000400000400002818144028284028286850485034344028284028284028280400004028284028284028284028284028284028281814142c24241814142c242438303038303058544c3830305c544c6c64585c544c6c64585c544c6c64585c544c5c544c38303058544c48443c3830302c24241814142c24243830302c24241814141814142c242448443c58544c38303018141404000004000004000004000004000004000004000004000004000004000018141448443c3830301814140400000400000400000400002818144028286850484028282818144028282818140400002818144028285034345034346850485034344028281814142c24241814142c242448443c3830302c24245c544c5c544c6c64585c544c6c64585c544c5c544c3830302c24243830303830302c24241814142c242458544c2c24242c242418141404000018141438303058544c48443c2c242404000004000004000004000004000004000004000004000004000004000018141458544c2c24241814140400000400000400000400000400004028286850485034344028284028284028280400004028284028284028284028285034344028284028281814142c24242c24241814142c242438303058544c3830305c544c5c544c5c544c5c544c5c544c5c544c38303058544c48443c3830301814142c24243830303830302c24241814141814140400001814142c242448443c58544c38303004000004000004000004000004000004000004000004000004000018141418141458544c2c24241814140400000400000400000400000400004028286850484028282818144028282818142818142818144028284028285034345034344028284028284028281814142c24242c24241814142c24243830302c24243830305c544c5c544c5c544c5c544c5c544c2c24243830303830302c24241814142c242458544c2c24242c242418141404000004000004000018141438303058544c48443c18141404000004000004000004000004000004000004000004000018141438303058544c2c24241814144028284028282818144028282818144028286850482818144028284c443c4028282818140400002818144028284028284028285034345034344028281814142c24242c24243830301814142c24243830302c24243830305c544c4c443c5c544c3830302c242448443c3830301814142c24243830303830302c24241814141814140400000400000400001814142c242448443c58544c2c242404000004000004000004000004000004000004000004000018141438303048443c2c242418141440282840282840282850343440282840282868504840282850343480786c28181440282828181428181440282850343440282840282868504880786ca49c8c80786c4c443c3830302c24241814142c24243830302c24243830305c544c4c443c58544c3830303830302c24241814142c242458544c3830302c242418141404000004000004000004000004000018141438303058544c38303018141404000004000004000004000004000004000004000018141448443c48443c181414402828402828402828503434402828685048402828685048402828402828a49c8c40282880786c28181480786ca49c8ca49c8c685048a49c8c402828a49c8c4c443c1814141814142c24243830302c24241814142c24243830302c24243830305c544c2c242448443c3830301814142c242438303058544c2c24242c24241814140400000400000400000400000400001814142c242448443c48443c2c242418141404000004000004000004000004000004000018141448443c383030181414402828402828503434402828685048402828402828685048503434503434a49c8c503434a49c8c281814a49c8c040000402828a49c8ca49c8c4028284c443c80786c4c443c1814141814143830303830303830301814142c24243830302c24243830302c24242c24241814141814142c24243830303830303830302c242418141404000004000004000004000004000004000018141448443c38303048443c3830300400000400000400000400000400002c24242c242448443c2c2424181414402828402828503434503434503434685048402828685048281814402828a49c8ca49c8ca49c8ca49c8ca49c8c80786c80786c40282880786ca49c8ca49c8ca49c8c80786c0000001814142c242438303048443c2c24242c24241814142c24242c24242c24241814141814142c242438303058544c38303048443c1814142818140400000400000400000400000400000400001814142c242448443c38303048443c3830300400000400000400000400001814142c24243830302c24241814140400000400000400002818142818144028284028286850484028284028284028285034344028284028282818142818142818140400005034344028284028284028284028284028280000001814142c242438303048443c2c24242c24241814142c24241814142c242418141438303038303058544c38303058544c18141428181404000004000004000004000004000004000004000018141438303048443c3830302c242404000004000004000004000018141438303048443c2c24240400000400000400000400000400000400002818144028285034344028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028284028282c24242c24242c24242c24244028284028284028284028282c24242c24242c24242c2424402828402828402828402828402828402828402828402828"
    local canvas = createCanvas();
    canvas:LoadImage(img);
end
