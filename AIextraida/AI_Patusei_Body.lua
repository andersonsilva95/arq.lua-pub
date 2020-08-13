-- AI_Patusei_Body.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Patusei_Body_Wait.frm",
        Func    = "Patusei_Body_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Patusei_Body_Check_Targeting",
                DelayFrame          = 110,
            },

            -- 근접공격01
            {
                AICheckFrame        = 110,
                AIFunc              = "Patusei_Body_Check_Attack01",
                DelayFrame          = 330,
            },

            -- 근접공격02
            {
                AICheckFrame        = 110,
                AIFunc              = "Patusei_Body_Check_Attack02",
                DelayFrame          = 330,
            },

            -- 근접공격03
            {
                AICheckFrame        = 110,
                AIFunc              = "Patusei_Body_Check_Attack03",
                DelayFrame          = 330,
            },

            -- 대소용돌이
            {
                AICheckFrame        = 55,
                AIFunc              = "Patusei_Body_Check_Attack04",
                DelayFrame          = 1100,
            },

        },
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Patusei_Body_Attack01.frm",
        Func    = "Patusei_Body_Attack01Func",
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK02",
        Motion  = "Patusei_Body_Attack02.frm",
        Func    = "Patusei_Body_Attack02Func",
    },
    
    -- 근접공격01
    {
        ID      = "ATTACK03",
        Motion  = "Patusei_Body_Attack03.frm",
        Func    = "Patusei_Body_Attack03Func",
    },
    
    -- 대소용돌이
    {
        ID      = "ATTACK04",
        Motion  = "Patusei_Body_Attack04.frm",
        Func    = "Patusei_Body_Attack04Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "Patusei_Body_Wait.frm",
        Func    = "Patusei_Body_DieFunc",
    },
}

CallBack =
{
    Land    = "OnPatusei_Body_Land",
    Die     = "OnPatusei_Body_Die",
    Damage  = "OnPatusei_Body_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitPatusei_Body( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( false )
    pMonster:SetFly( true ) 
    pMonster:SetX( 2.38 )
    pMonster:SetY( 1.11 )
pMonster:SetHP( 1 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Patusei_Body_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 죽는상태
function Patusei_Body_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == pMonster:GetLastFrame() - 1 ) then
		local posx = 0.0
		local posy = 0.25
		pMonster:AddParticleNoDirection("Patu_Arm", posx - 0.3, posy )
		pMonster:AddParticleNoDirection("Patu_Spark_01", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_02", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_03", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_04", posx, posy)
		pMonster:AddParticleNoDirection("Patu_Spark_05", posx, posy)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end

--  근접공격01 상태
function Patusei_Body_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
		pMonster:AddDamage( DT_MONSTER_PATUSEI_BODY01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격02 상태
function Patusei_Body_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
		pMonster:AddDamage( DT_MONSTER_PATUSEI_BODY02 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격03 상태
function Patusei_Body_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 41 ) then
		pMonster:AddDamage( DT_MONSTER_PATUSEI_BODY03 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  대소용돌이 상태
function Patusei_Body_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 61 ) then
		pMonster:AddParticle( "whirlpool01", 1.9, -0.4 )	--소용돌이01
		pMonster:AddParticle( "whirlpool02", 1.9, -0.4 )	--소용돌이01
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 1.9, -0.3 )	--소용돌이01
	elseif( iFrame == 66 ) then
		pMonster:AddParticle( "whirlpool01", 0.0, -2.2 )	--소용돌이02
		pMonster:AddParticle( "whirlpool02", 0.0, -2.2 )	--소용돌이02
	elseif( iFrame == 71 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 1.9, 0.1 ) --소용돌이01
		pMonster:AddParticle( "whirlpool01", -0.4, -0.2 )	--소용돌이03
		pMonster:AddParticle( "whirlpool02", -0.4, -0.2 )	--소용돌이03
	elseif( iFrame == 76 ) then
		pMonster:AddParticle( "whirlpool01", 0.7, -1.12 )		--소용돌이04
		pMonster:AddParticle( "whirlpool02", 0.7, -1.12 )		--소용돌이04
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 0.7, -1.02 )	--소용돌이04
	elseif( iFrame == 81 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 1.9, 0.5 )	--소용돌이01
		pMonster:AddParticle( "whirlpool01", 2.4, -2.5 )	--소용돌이05
		pMonster:AddParticle( "whirlpool02", 2.4, -2.5 )	--소용돌이05
	elseif( iFrame == 86 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 0.7, -0.62 )	--소용돌이04
	elseif( iFrame == 91 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO02, 1.9, 0.9 )	--소용돌이01
	elseif( iFrame == 96 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO01, 0.7, -0.22 )	--소용돌이04
	elseif( iFrame == 106 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_DARKTORNADO02, 0.7, 0.18 )	--소용돌이04
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Patusei_Body_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 800, -500, 600, 500, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Patusei_Body_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 700, -300, -100, 300, -300 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Patusei_Body_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 700, -300, 100, 300, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Patusei_Body_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 700, -300, 300, 300, 100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Patusei_Body_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnPatusei_Body_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnPatusei_Body_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnPatusei_Body_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
		
	pMonster:SetIsRight( false )
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( true )
	pMonster:SetFly( true ) 
end
