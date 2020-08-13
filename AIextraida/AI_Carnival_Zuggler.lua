-- AI_Carnival_Zuggler.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Zuggler_Wait.frm",
        Func    = "Zuggler_WaitFunc",

		-- �������ϵ��� ����ɼ� �ִ� Ʈ���ŵ��� �����Ѵ�.
        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 120,                            -- �󸶳� ���� ������ Ʈ���Ÿ� üũ�� �������� ��ġ�� �Է�(������)
                AIFunc              = "Zuggler_Check_Targeting",    -- Ʈ���Ű� üũ�Ǿ����� ����� ������ �Լ��� �̸��� �Է�(���������� �Է��ϴ� �Լ�)
                DelayFrame          = 120,                           -- ����� ����Ǿ����� Ʈ���� üũ�� �󸶵��� ���� �������� ��ġ�� �Է�
            },
            -- Ÿ������
            {
                AICheckFrame        = 275,
                AIFunc              = "Zuggler_Check_ReleaseTarget",
                DelayFrame          = 550,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 75,
                AIFunc              = "Zuggler_Check_TurnToTarget",
                DelayFrame          = 75,
            },

            -- �ȱ� [50%]
            {
                AICheckFrame        = 75,
				AICheckFrame1       = 55,
				AICheckFrame2       = 35,
                AIFunc              = "Zuggler_Check_Walk",
                DelayFrame          = 55,
            },

            -- ������
            {
                AICheckFrame        = 102,
				AICheckFrame1       = 82,
				AICheckFrame2       = 62,
                AIFunc              = "Zuggler_Check_JumpUp",
                DelayFrame          = 100,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 101,
				AICheckFrame1       = 81,
				AICheckFrame2       = 61,
                AIFunc              = "Zuggler_Check_JumpDown",
                DelayFrame          = 55,
            },

            -- Attack01
            {
                AICheckFrame        = 150,
				AICheckFrame1       = 100,
				AICheckFrame2       = 50,
                AIFunc              = "Zuggler_Check_Attack01",
                DelayFrame          = 99,
            },

			-- Attack02
            {
                AICheckFrame        = 50,
				AICheckFrame1       = 40,
				AICheckFrame2       = 30,
                AIFunc              = "Zuggler_Check_Attack02",
                DelayFrame          = 100,
            },

			-- Attack03
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 75,
				AICheckFrame2       = 50,
                AIFunc              = "Zuggler_Check_Attack03",
                DelayFrame          = 300,
            },

        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Zuggler_Walk.frm",
        Func            = "Zuggler_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Zuggler_MoveFail",


        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 60,
                AIFunc              = "Zuggler_Check_Targeting",
                DelayFrame          = 60,
            },
            -- Ÿ������
            {
                AICheckFrame        = 175,
                AIFunc              = "Zuggler_Check_ReleaseTarget",
                DelayFrame          = 450,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 45,
                AIFunc              = "Zuggler_Check_TurnToTarget",
                DelayFrame          = 45,
            },
            -- ������
            {
                AICheckFrame        = 52,
                AIFunc              = "Zuggler_Check_JumpUp",
                DelayFrame          = 55,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 51,
                AIFunc              = "Zuggler_Check_JumpDown",
                DelayFrame          = 55,
            },
			-- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "Zuggler_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
    -- Attack01
    {
        ID      = "ATTACK01",
        Motion  = "Zuggler_Attack_01.frm",
        Func    = "Zuggler_Attack01Func",
    },
	
    -- Attack02
    {
        ID      = "ATTACK02",
        Motion  = "Zuggler_Attack_02.frm",
        Func    = "Zuggler_Attack02Func",
    },
	
    -- Attack03
    {
        ID      = "ATTACK03",
        Motion  = "Zuggler_Attack_03.frm",
        Func    = "Zuggler_Attack03Func",
    },
	
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Zuggler_Jump_Up.frm",
        Func    = "Zuggler_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Zuggler_Jump_Down.frm",
        Func    = "Zuggler_JumpDownFunc",
    },
    
    -- ���� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Zuggler_Jump_Landing.frm",
        Func    = "Zuggler_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Zuggler_Damage_Up.frm",
        Func    = "Zuggler_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Zuggler_Damage_Middle.frm",
        Func    = "Zuggler_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Zuggler_Damage_Down.frm",
        Func    = "Zuggler_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_UP01",
        Motion              = "Zuggler_Down_Up_01.frm",
        Func                = "Zuggler_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Zuggler_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "Zuggler_Down_Up_02.frm",
        Func                = "Zuggler_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "Zuggler_Down_Up_03.frm",
        Func                = "Zuggler_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Zuggler_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "Zuggler_Down_Middle.frm",
        Func                = "Zuggler_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Zuggler_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_DOWN",
        Motion              = "Zuggler_Down_Down.frm",
        Func                = "Zuggler_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Zuggler_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "Zuggler_Down_Special_01.frm",
        Func                = "Zuggler_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID                  = "DOWN_SPECIAL_LANDING",
        Motion              = "Zuggler_Down_Special_02.frm",
        Func                = "Zuggler_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Zuggler_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID                  = "DIE_1",
        Motion              = "Zuggler_Die_01.frm",
        Func                = "Zuggler_Die1Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID                  = "DIE_2",
        Motion              = "Zuggler_Die_02.frm",
        Func                = "Zuggler_Die2Func",
        IsFallDownMotion    = TRUE,
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Zuggler_Stand_Up.frm",
        Func    = "Zuggler_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Zuggler_Stone.frm",
        Func    = "Zuggler_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Zuggler_Stone.frm",
        Func    = "Zuggler_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Zuggler_Stone.frm",
		Func	= "Zuggler_HoldFunc",
	},
	-- ��ȯ
    {
        ID      = "SUMMON",
        Motion  = "Zuggler_Wait.frm",
        Func    = "Carnival_Zuggler_SummonFunc",
	},
}

CallBack =
{
    Land    = "Zuggler_Land",
    Die     = "Zuggler_Die",
    Damage  = "Zuggler_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitCarnival_Zuggler( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,           "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,         "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,             "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,         "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,           "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,         "DOWN_SPECIAL" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,		"ICECURSE" )
	pMonster:RegistReaction( ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,		"HOLD"	)	
	
	local MaxHP = pMonster:GetHP()
	local AttackPoint = pMonster:GetAttackPoint()
	if( 30 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *1
		AttackPoint = AttackPoint *1
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	elseif( 50 == pMonster:GetLevel() ) then
		MaxHP = MaxHP *2
		AttackPoint = AttackPoint *1
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	else
		MaxHP = MaxHP *3
		AttackPoint = AttackPoint *3
		pMonster:SetMaxHP( MaxHP )
		pMonster:SetHP( MaxHP )
		pMonster:SetAttackPoint( AttackPoint )
	end
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Zuggler_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:SetSpeedX( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Zuggler_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �״»���1
function Zuggler_Die1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(983030)
	elseif( iFrame == 40 ) then
		pMonster:PlaySound(992029)
		pMonster:AddDamage( DT_MON_ZUGGLER_DIE )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- �״»���2
function Zuggler_Die2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(983030)
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(983003)
		pMonster:AddDamage( DT_MON_ZUGGLER_DIE )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Zuggler_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Zuggler_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
		
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_2" )
        end
    end
end

-- �ٿ� ��2
function Zuggler_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
		
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_2" )
        end
    end
end

-- �ٿ� ��3
function Zuggler_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )                
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_2" )
        end
    end
end

-- �ٿ� �̵�
function Zuggler_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )                
        
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_2" )
        end        
    end
end

-- �ٿ� �ٿ�
function Zuggler_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 7 ) then
        pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )
        pMonster:SetSpeedY( 0.032 )        
    elseif( iFrame >= pMonster:GetLastFrame() ) then
            pMonster:SetState( "DOWN_UP01" )
    end
end

-- �ٿ� �����
function Zuggler_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end
end

-- �ٿ� ����� ����
function Zuggler_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_2" )
        end
    end
end

-- �Ͼ��
function Zuggler_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  Attack01
function Zuggler_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 1 ) then
		pMonster:SetPushCheck( false )
	elseif( iFrame == 28 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate( DT_MON_ZUGGLER_ATTACK1, 0.0, 0.3 )
		else
			pMonster:AddDamageWithLocate( DT_MON_ZUGGLER_ATTACK1_R, 0.0, 0.3 )
		end
	elseif( iFrame == 40 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate( DT_MON_ZUGGLER_ATTACK1, 0.0, 0.3 )
		else
			pMonster:AddDamageWithLocate( DT_MON_ZUGGLER_ATTACK1_R, 0.0, 0.3 )
		end
	elseif( iFrame == 55 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocate( DT_MON_ZUGGLER_ATTACK1, 0.0, 0.3 )
		else
			pMonster:AddDamageWithLocate( DT_MON_ZUGGLER_ATTACK1_R, 0.0, 0.3 )
		end
	elseif( iFrame > 55 ) then
		pMonster:SetPushCheck( true )
	end
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  Attack02
function Zuggler_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame == 1 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Circus_Jugler_Start_01", 0.0, 0.1 )
			pMonster:AddParticle( "Circus_Jugler_Start_02", 0.0, 0.1 )
			pMonster:AddParticle( "Circus_Jugler_Start_03", 0.0, 0.1 )
		else
			pMonster:AddParticle( "Circus_Jugler_Start_01_R", 0.0, 0.1 )
			pMonster:AddParticle( "Circus_Jugler_Start_02_R", 0.0, 0.1 )
			pMonster:AddParticle( "Circus_Jugler_Start_03_R", 0.0, 0.1 )
		end
	elseif( iFrame == 5 ) then
		pMonster:PlaySound(983017)
	elseif( iFrame == 20 ) then
		pMonster:PlaySound(983017)
	elseif( iFrame == 35 ) then
		pMonster:PlaySound(983017)
	elseif( iFrame == 73 ) then
		pMonster:PlaySound(983011)
    elseif( iFrame == 80 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Circus_Jugler_Shot", 0.2, 0.08 )
		else
			pMonster:AddParticle( "Circus_Jugler_Shot_R", 0.2, 0.08 )
		end	
        pMonster:AddDamage( DT_MON_ZUGGLER_ATTACK2 )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  Attack03
function Zuggler_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 53 ) then
		--pMonster:SkillReadyEffect( 200, 200, 200, -0.05 )
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(983012)
	elseif( iFrame == 65 ) then
		pMonster:AddDamage( DT_MON_ZUGGLER_ATTACK3 )
		pMonster:AddTraceParticleToBone( "Jugler_Spin_01", 0.5, 13, 0, 0, 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function Zuggler_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function Zuggler_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ���� ����
function Zuggler_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Zuggler_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_1" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Zuggler_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_1" )
		end
    end
end

-- Ȧ�� �ɷ���(����Ʈ)
function Zuggler_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor(true)
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSuperArmor( false )
		pMonster:SetState( "WAIT" )
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_1" )
		end
	end
end

-- ��ȯ
function Carnival_Zuggler_SummonFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "WAIT" )
end
-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Zuggler_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -330, 260, 330, -250 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Zuggler_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -450, 360, 450, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Zuggler_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
        pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end
end

function Zuggler_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -250, 460, 250, -400 ) == false and pMonster:FloatRand() < 0.5 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Zuggler_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -250, 460, 250, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Zuggler_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function Zuggler_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 220, -150, 50, 150, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Zuggler_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 50, 200, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Zuggler_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 80, -80, 50, 80, -100 ) == true ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Zuggler_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -200, 200, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Zuggler_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Zuggler_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 120, -120, -100, 120, -280 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )			
		pMonster:ResetDelay()
	end
end

function Zuggler_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function Zuggler_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
        pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end
end

function Zuggler_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckState( "DOWN_UP01" ) == false and 
		pMonster:CheckState( "DOWN_UP02" ) == false and 
		pMonster:CheckState( "DOWN_MIDDLE" ) == false and 
		pMonster:CheckState( "DOWN_DOWN" ) == false and 
		pMonster:CheckState( "DOWN_UP_LANDING" ) == false and 
		pMonster:CheckState( "DOWN_SPECIAL" ) == false and 
		pMonster:CheckState( "DOWN_SPECIAL_LANDING" ) == false and 
		pMonster:CheckState( "STONECURSE" ) == false and 
		pMonster:CheckState( "ICECURSE" ) == false  and 
		pMonster:CheckState( "HOLD" ) == false ) then

		pMonster:TurnToTarget()
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end
		
        pMonster:SetState( "DIE_1" )
    end
    
end
	
function Zuggler_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)	
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end
		
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		pMonster:SetNoCheckContact( 25 )
		if( pMonster:CheckState( "DAMAGE_UP" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 3 )
			pMonster:SetSpeedY( 0.024 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.032 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )
		elseif( pMonster:CheckState( "DAMAGE_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.02 )			
			pMonster:SetState( "DOWN_UP01" )			
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			if( pMonster:GetIsRight() == true) then
				pMonster:SetSpeedX( -0.025 )			
			else
				pMonster:SetSpeedX( 0.025 )			
			end
			pMonster:SetNoCheckContact( 5 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end
end

function Zuggler_Jump( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local fTargetX = pMonster:GetTargetX()
    local fTargetY = pMonster:GetTargetY()
    
    local fMonX = pMonster:GetX()
    local fMonY = pMonster:GetY()
        
    fSpeedX = ( fTargetX - fMonX ) * 1.5
    fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))

    pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
    pMonster:TurnToTarget()
    pMonster:SetSpeedX( fSpeedX * 0.01 )
    pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Zuggler_MoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.1) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end