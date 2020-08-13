-- AI_GiantStoneGolem.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "GiantStoneGolem_Wait.frm",
        Func    = "GiantStoneGolem_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "GiantStoneGolem_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "GiantStoneGolem_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "GiantStoneGolem_Check_Walk",
                DelayFrame          = 110,
            },
            -- 근접공격
            {
                AICheckFrame        = 45,
                AIFunc              = "GiantStoneGolem_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 포효
            {
                AICheckFrame        = 110,
                AIFunc              = "GiantStoneGolem_Check_Attack02",
                DelayFrame          = 1100,
            },
            -- 땅찍기
            {
                AICheckFrame        = 110,
                AIFunc              = "GiantStoneGolem_Check_Attack03",
                DelayFrame          = 220,
            },
            -- 휠윈드
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantStoneGolem_Check_Attack04",
                DelayFrame          = 220,
            },
            -- 밥상뒤업기
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantStoneGolem_Check_Attack05",
                DelayFrame          = 220,
            },            
            -- 천지파열
            {
                AICheckFrame        = 110,
                AIFunc              = "GiantStoneGolem_Check_Attack06",
                DelayFrame          = 880,
            },
			-- 골렘소환
            {
                AICheckFrame        = 165,
                AIFunc              = "GiantStoneGolem_Check_Attack07",
                DelayFrame          = 2200,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "GiantStoneGolem_Walk.frm",
        Func    = "GiantStoneGolem_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "GiantStoneGolem_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantStoneGolem_Check_TurnToTarget",
                DelayFrame          = 55,
            },
			-- 근접공격
            {
                AICheckFrame        = 35,
                AIFunc              = "GiantStoneGolem_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 밥상뒤업기
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantStoneGolem_Check_Attack05",
                DelayFrame          = 220,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "GiantStoneGolem_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "GiantStoneGolem_Attack01.frm",
        Func    = "GiantStoneGolem_Attack01Func",
    },
    
    -- 포효
    {
        ID      = "ATTACK02",
        Motion  = "GiantStoneGolem_Attack02.frm",
        Func    = "GiantStoneGolem_Attack02Func",
    },
    
    -- 땅찍기
    {
        ID      = "ATTACK03",
        Motion  = "GiantStoneGolem_Attack03.frm",
        Func    = "GiantStoneGolem_Attack03Func",
    },
        
    -- 휠윈드
    {
        ID      = "ATTACK04",
        Motion  = "GiantStoneGolem_Attack04.frm",
        Func    = "GiantStoneGolem_Attack04Func",
    },
    
    -- 밥상뒤업기
    {
        ID      = "ATTACK05",
        Motion  = "GiantStoneGolem_Attack05.frm",
        Func    = "GiantStoneGolem_Attack05Func",
    },
    
    -- 천지파열
    {
        ID      = "ATTACK06",
        Motion  = "GiantStoneGolem_Attack06.frm",
        Func    = "GiantStoneGolem_Attack06Func",
    },
	
	-- 골렘소환
    {
        ID      = "ATTACK07",
        Motion  = "GiantStoneGolem_Attack07.frm",
        Func    = "GiantStoneGolem_Attack07Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "GiantStoneGolem_Die.frm",
        Func    = "GiantStoneGolem_DieFunc",
    },
}

CallBack =
{
    Land    = "OnGiantStoneGolem_Land",
    Die     = "OnGiantStoneGolem_Die",
    Damage  = "OnGiantStoneGolem_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGiantStoneGolem( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
--[[
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
--]]
	pMonster:SetY( 0.23 )
	pMonster:RegisterSummonMonsterType( MON_MINIGOLEM )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function GiantStoneGolem_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 걷기 상태
function GiantStoneGolem_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame == 81 ) then
		pMonster:PlaySound( "282" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:PlaySound( "282" )
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function GiantStoneGolem_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

-- 데미지 입은거
function GiantStoneGolem_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function GiantStoneGolem_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 72 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_STONE_GOLEM_PUNCH )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 포효
function GiantStoneGolem_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local iEndFrame = pMonster:GetLastFrame()
    
    if( iFrame > 72 and iFrame < iEndFrame ) then
        pMonster:Fear( false )
        if( iFrame == 82 ) then
            pMonster:Fear( true )
        end
    end
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 73 ) then
		pMonster:PlaySound( "281" )
		pMonster:CameraVib( 1, 1.0, 0.02 )
    elseif( iFrame >= iEndFrame ) then		
        pMonster:SetState( "WAIT" )
    end
end

--  땅찍기 상태
function GiantStoneGolem_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText("JUMP")
    elseif( iFrame == 76 ) then
		local posx = 0.8
		local posy = 0.0
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Elderkung_Down_01", posx, posy)
		pMonster:AddParticleNoDirection("Elderkung_Down_02", posx, posy)
		pMonster:EarthQuake( 30, 0.06, 0.04 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  휠윈드
function GiantStoneGolem_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
        --pMonster:SkillReadyEffectNoStop( 20, 20, 20, 0.5 )
        pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.5 )
    elseif( iFrame == 86 ) then
		--pMonster:AddDamage( DT_STONE_GOLEM_WHIRL_WIND )
		--pMonster:AddDamage( DT_STONE_GOLEM_TORNADO1 )
		pMonster:AddDamage( DT_STONE_GOLEM_TORNADO2 )
		--pMonster:AddDamage( DT_STONE_GOLEM_TORNADO3 )
	elseif( iFrame > 86 and iFrame < 161) then
		if( math.mod( (iFrame - 7) , 20 ) == 0 ) then
			pMonster:PlaySound( "244" )
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  밥상뒤업기
function GiantStoneGolem_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 76 ) then
		pMonster:PlaySound( "283" )
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 0.6, 0.0 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 0.6, -0.1 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 0.6, -0.1 )
	elseif( iFrame == 86 ) then
		pMonster:PlaySound( "283" )
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 1.1, 0.0 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 1.1, -0.1 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 1.1, -0.1 )
	elseif( iFrame == 96 ) then
		pMonster:PlaySound( "283" )
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 1.6, 0.0 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 1.6, -0.1 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 1.6, -0.1 )
	elseif( iFrame == 106 ) then
		pMonster:PlaySound( "283" )
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_BABSANG, 2.1, 0.0 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT01", 2.1, -0.1 )
		pMonster:AddParticle( "EFFECT_STONEGOLEM_UPLIFT02", 2.1, -0.1 )

	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  천지파열 상태
function GiantStoneGolem_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText("DANGER")
        pMonster:PlaySound( "129" )
    elseif( iFrame == 41 ) then
        --pMonster:SkillReadyEffectNoStop( 20, 20, 20, 0.5 )
        pMonster:SkillReadyEffectNoStop( 0, 0, 0, 0.5 )
    elseif( iFrame == 91 ) then
		pMonster:EarthQuake( 30, 0.06, 0.04 )
		local posx = 0.8
		local posy = 0.0
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Elderkung_Down_02", posx, posy)
			pMonster:AddParticleNoDirection("SK_Scratch_R", posx, posy)
		else
			pMonster:AddParticleNoDirection("Elderkung_Down_02", posx, posy)
			pMonster:AddParticleNoDirection("SK_Scratch", posx, posy)
		end
		
	elseif( iFrame == 94 ) then
		pMonster:PlaySound( "47" )
	elseif( iFrame == 111 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 0.16, 3.0, true )
	elseif( iFrame == 121 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.20, 3.0, true )
	elseif( iFrame == 131 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.40, 3.0, true )
	elseif( iFrame == 141 ) then
	elseif( iFrame == 151 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.76, 3.0, true )
	elseif( iFrame == 161 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.80, 3.0, true )
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 1.00, 3.0, true )
	elseif( iFrame == 171 ) then
	elseif( iFrame == 181 ) then
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 2.00, 3.0, true )
		pMonster:AddDamageWithLocate( DT_STONE_GOLEM_THROW_STONE, 0.50, 3.0, true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  골렘소환 상태
function GiantStoneGolem_Attack07Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 31 ) then
		pMonster:PlaySound( "281" )
    elseif( iFrame == 81 ) then
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_MINIGOLEM
        pMon.fX = -200
        pMon.fY = 400
        pMonster:SummonMonster( pMon )
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_MINIGOLEM
        pMon.fX = 200
        pMon.fY = 400
        pMonster:SummonMonster( pMon )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function GiantStoneGolem_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function GiantStoneGolem_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function GiantStoneGolem_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetX() > 0.8 and pMonster:GetX() <= 1.7 and pMonster:CheckTargetInRange( 0, -300, 400, 300, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetX() > 0.8 and pMonster:GetX() <= 1.7 and pMonster:CheckTargetInRange( 400, -400, 300, 400, -200 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

function GiantStoneGolem_Check_Attack07( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:GetSummonedMonsterCount() < 1 and pMonster:GetX() >= 0.5 and pMonster:GetX() <= 2.1 ) then
		pMonster:SetState( "ATTACK07" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGiantStoneGolem_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnGiantStoneGolem_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnGiantStoneGolem_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	   
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	if ( pMonster:FloatRand() < 0.2 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK03" )	
		else
			pMonster:SetState( "ATTACK05" )	
		end
		pMonster:TurnToTarget()
        pMonster:SetSuperArmor(true)
	end
end
