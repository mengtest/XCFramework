---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by ricashao.
--- DateTime: 2020/4/16 19:49
---
local RoundExecute = BaseClass("RoundExecute")

local function __init(self)
    self.attackerId = 0
    self.hpConsume = 0
    self.eBattleOperate = BattleOperate.eAttackOperate -- 操作类型
    self.operatorId = 0 -- 操作ID，对于魔法，则是魔法ID
    self.aimId = 0     -- 消息ID，操作失败要发个消息 
    --self.buffs = {};
end

local function Parse(self, data)
    self.attackerId = data.attackerid
    self.hpConsume = data.hpconsume
    self.operatorId = data.operationid
    self.aimId = data.aimIndex
    self.eBattleOperate = data.operationtype
    if (data.demobuffs) then
        for _, buff in pairs(data.demobuffs) do
            local battler = BattleManager:GetInstance():GetBattle():FindBattlerByID(battlerId)
            if battler then
                battler:GetBuffAgent():UpdateBuff(buff)
                --facade.executeMediator(ModuleId.Battle, false, "refreshBattlerBuff", true, battler.getBattlerId())
            end
        end
    end
end

RoundExecute.__init = __init
RoundExecute.Parse = Parse
return RoundExecute