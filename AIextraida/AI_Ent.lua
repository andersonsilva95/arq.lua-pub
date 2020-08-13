-- AI_Ent.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Ent_Wait.frm",
        Func    = "Ent_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���Ͽ� ����
            {
                AICheckFrame        = 45,
                AIFunc              = "Ent_Check_TurnToTarget",
                DelayFrame          = 110,
            },

            -- �ȱ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Walk",
                DelayFrame          = 110,
            },
            -- 2�ܰ���
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Attack01",
                DelayFrame          = 220,
            },
            -- ���ı����
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Attack02",
                DelayFrame          = 330,
            },

            -- ���������
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Attack03",
                DelayFrame          = 55,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Ent_Walk.frm",
        Func    = "Ent_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Ent_MoveFail",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "Ent_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ���� ���Ͽ� ����
            {
                AICheckFrame        = 25,
                AIFunc              = "Ent_Check_TurnToTarget",
                DelayFrame          = 75,
            },  
            -- 2�ܰ���
            {
                AICheckFrame        = 75,
                AIFunc              = "Ent_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ���߱�
            {
                AICheckFrame        = 110,
                AIFunc              = "Ent_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },

    -- 2�ܰ���
    {
        ID      = "ATTACK01",
        Motion  = "Ent_Attack01.frm",
        Func    = "Ent_Attack01Func",
    },

    -- ���ı����
    {
        ID      = "ATTACK02",
        Motion  = "Ent_Attack02.frm",
        Func    = "Ent_Attack02Func",
    },
    
    -- ���������
    {
        ID      = "ATTACK03",
        Motion  = "Ent_Attack03.frm",
        Func    = "Ent_Attack03Func",
    },

    -- ������ ��,��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Ent_Damage_Up.frm",
        Func    = "Ent_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Ent_Damage_Down.frm",
        Func    = "Ent_DamageFunc",
    },
    
    -- ū ������ 
    {
        ID      = "DAMAGE_BIG",
        Motion  = "Ent_Damage.frm",
        Func    = "Ent_DamageFunc",
    },

    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Ent_Die.frm",
        Func    = "Ent_DieFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Ent_Stone.frm",
        Func    = "Ent_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Ent_Stone.frm",
        Func    = "Ent_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Ent_Stone.frm",
		Func	= "Ent_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnEnt_Land",
    Die     = "OnEnt_Die",
    Damage  = "OnEnt_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitEnt( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_BIG" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Ent_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Ent_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( (iFrame >= 0 and iFrame <= 49) or (iFrame >= 68 and iFrame <= 116) ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	end
    
	if( iFrame == 45 ) then
		--pMonster:PlaySound(211)
		pMonster:PlaySound(999039)
	elseif( iFrame == 108 ) then
		pMonster:PlaySound(999039)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

-- 2�ܰ��� ����
function Ent_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 97 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_MONSTER_ENT01 )
	elseif( iFrame >= 112 and iFrame < 130 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	elseif( iFrame == 132 ) then
		pMonster:PlaySound( "244" )
		pMonster:AddDamage( DT_MONSTER_ENT02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���ı���� ����
function Ent_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 71 ) then
	    pMonster:StartText( "DANGER" )
        pMonster:PlaySound( "129" )
    elseif( iFrame == 75 ) then
		pMonster:SkillReadyEffectNoStop( 100, 200, 100, 0.0 )
	elseif( iFrame == 114 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamage( DT_ENT_LAND )
		pMonster:AddDamage( DT_ENT_LAND_SMOKE )
		pMonster:EarthQuake( 19, 0.0, 0.0 )
	-- 10������ ���̿� ���� �پ������� �ٱ⿡ ������..
	elseif( iFrame >= 115 and iFrame <= 125 ) then
        if( iFrame == 119 ) then
            -- �ٱⰡ Ƣ����� ������ �ϱ� ����.. �Լ��� �ι�° �Ķ���Ͱ� true�̸� �ٱ� Ƣ����� ����Ʈ ���´�
            pMonster:FreezeAttack( -0.01, true )
        else
            pMonster:FreezeAttack( -0.01, false )
        end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ��������� ����
function Ent_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 22 ) then
        pMonster:ComputeAngleToTarget( 0.3, 0.6 ) -- Ÿ�������� ������ ���
    elseif( iFrame == 131 ) then
        pMonster:AddDamageWithAngle( DT_MONSTER_ENT03, pMonster:GetAngleToTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �׾���
function Ent_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= 26 and iFrame < 51 ) then
		pMonster:PlaySound(210)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Ent_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:PlaySound(209)
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )

    end
end

--  ����Ŀ�� �ɷ���
function Ent_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:SetPushCheck( false )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Ent_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_middle_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_middle_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_middle_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_middle_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function Ent_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Middle", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Middle", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
function Ent_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -800, 600, 800, -100 ) == true ) then
        pMonster:ResetDelay()
    end
end

function Ent_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Ent_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 600, 500, -500 ) == true ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
    end
end

function Ent_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Ent_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 150, 100, -150 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Ent_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -300, 400, 300, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Ent_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 500, -200, 600, 200, -100 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnEnt_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

end

function OnEnt_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnEnt_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetNoCheckContact(0)
    pMonster:SetSpeedX( pMonster:GetSpeedX() / 2.0 )
    pMonster:SetSpeedY( 0.0 )
end

function Ent_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    --pMonster:SetSpeedX( pMonster:GetSpeedX() * -1 )
    --pMonster:SetState( "WALK" )

    pMonster:SetSpeedX( 0.0 )
    pMonster:SetState( "WAIT" )
end