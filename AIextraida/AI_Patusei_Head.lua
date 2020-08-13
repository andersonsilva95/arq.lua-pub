-- AI_Patusei_Head.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Patusei_Head_Wait.frm",
        Func    = "Patusei_Head_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 25,
                AIFunc              = "Patusei_Head_Check_Targeting",
                DelayFrame          = 110,
            },
            -- 용왕빔
            {
                AICheckFrame        = 90,
                AIFunc              = "Patusei_Head_Check_Attack01",
                DelayFrame          = 123,
            },
        },
    },
    
    -- 용왕빔
    {
        ID      = "ATTACK01",
        Motion  = "Patusei_Head_Attack01.frm",
        Func    = "Patusei_Head_Attack01Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "patusei_head_die.frm",
        Func    = "Patusei_Head_DieFunc",
    },
}

CallBack =
{
    Land    = "OnPatusei_Head_Land",
    Die     = "OnPatusei_Head_Die",
    Damage  = "OnPatusei_Head_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitPatusei_Head( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetIsRight( false )
    pMonster:SetFly( true ) 
    pMonster:SetX( 2.37 )
    pMonster:SetY( 1.56 )
pMonster:SetHP( 1 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Patusei_Head_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 죽는상태
function Patusei_Head_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
        pMonster:EndMonster()
    end
end

--  근접공격 상태
function Patusei_Head_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
		pMonster:SkillReadyEffectNoStop( 220, 220, 220, 0.0 )
    elseif( iFrame == 61 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.15 )
    elseif( iFrame == 81 ) then
		pMonster:AddParticle( "patu_beam_01", 0.11, 0.19 )
		pMonster:AddParticle( "patu_beam_02", 0.11, 0.19 )
		pMonster:AddParticle( "patu_beam_03", 0.11, 0.19 )
		pMonster:AddParticle( "Las01_Hornet_Sting_Finish_01", 0.11, 0.19 )
		pMonster:AddDamageWithAngle( DT_MONSTER_YONGWANG_BEAM, pMonster:GetAngleToTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Patusei_Head_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Patusei_Head_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnPatusei_Head_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
end

function OnPatusei_Head_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end

function OnPatusei_Head_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetIsRight( false )
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    pMonster:SetPushCheck( true )
	pMonster:SetFly( true ) 
end
