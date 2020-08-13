-- AI_SkeletonArcher.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "SkeletonArcher_Wait.frm",
        Func    = "SkeletonArcher_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "SkeletonArcher_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "SkeletonArcher_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonArcher_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- �̵�
            {
                AICheckFrame        = 110,
                AIFunc              = "SkeletonArcher_Check_Walk",
                DelayFrame          = 220,
            },
            -- ����01
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonArcher_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ����02
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonArcher_Check_Attack02",
                DelayFrame          = 110,
            },
            -- ����03
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonArcher_Check_Attack03",
                DelayFrame          = 110,
            },
            -- ȸ�ǰ���
            {
                AICheckFrame        = 25,
                AIFunc              = "SkeletonArcher_Check_AvoidAttack",
                DelayFrame          = 75,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "SkeletonArcher_Check_RunAway",
                DelayFrame          = 55,
            },
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "SkeletonArcher_Check_Idle",
                DelayFrame          = 110,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "SkeletonArcher_Walk.frm",
        Func    = "SkeletonArcher_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "SkeletonArcher_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "SkeletonArcher_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "SkeletonArcher_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "SkeletonArcher_Check_TurnToTarget",
                DelayFrame          = 35,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "SkeletonArcher_Check_WalkStop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- ������
    {
        ID      = "IDLE",
        Motion  = "SkeletonArcher_Wait.frm",
        Func    = "SkeletonArcher_IdleFunc",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "SkeletonArcher_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },
    
    -- ��������
    {
        ID      = "RUNAWAY",
        Motion  = "SkeletonArcher_Walk.frm",
        Func    = "SkeletonArcher_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "SkeletonArcher_RunAwayMoveFail",


        Trigger =
        {
			-- ȸ�ǰ���
            {
                AICheckFrame        = 25,
                AIFunc              = "SkeletonArcher_Check_AvoidAttack2",
                DelayFrame          = 75,
            },
             -- ����
            {
                AICheckFrame        = 10,
                AIFunc              = "SkeletonArcher_Check_RunAwayStop",
                DelayFrame          = 10,
            },
        }
    },
    
    -- ���Ÿ�����01
    {
        ID      = "ATTACK01",
        Motion  = "SkeletonArcher_Attack01.frm",
        Func    = "SkeletonArcher_Attack01Func",
    },
    
    -- ���Ÿ�����02
    {
        ID      = "ATTACK02",
        Motion  = "SkeletonArcher_Attack02.frm",
        Func    = "SkeletonArcher_Attack02Func",
    },
    
    -- ���Ÿ�����03
    {
        ID      = "ATTACK03",
        Motion  = "SkeletonArcher_Attack03.frm",
        Func    = "SkeletonArcher_Attack03Func",
    },
    
    -- ȸ�ǰ���
    {
        ID      = "AVOIDATTACK",
        Motion  = "SkeletonArcher_AvoidAttack.frm",
        Func    = "SkeletonArcher_AvoidAttackFunc",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "SkeletonArcher_Jump.frm",
        Func    = "SkeletonArcher_JumpFunc",
    },

    -- ��������
    {
        ID      = "HIGHJUMP",
        Motion  = "SkeletonArcher_Jump.frm",
        Func    = "SkeletonArcher_HighJumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "SkeletonArcher_Damage_Up.frm",
        Func    = "SkeletonArcher_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "SkeletonArcher_Damage_Middle.frm",
        Func    = "SkeletonArcher_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "SkeletonArcher_Damage_Down.frm",
        Func    = "SkeletonArcher_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "SkeletonArcher_Down_Up01.frm",
        Func    = "SkeletonArcher_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "SkeletonArcher_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "SkeletonArcher_Down_Up02.frm",
        Func    = "SkeletonArcher_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "SkeletonArcher_Down_Up03.frm",
        Func    = "SkeletonArcher_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "SkeletonArcher_Down_Middle.frm",
        Func    = "SkeletonArcher_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "SkeletonArcher_Down_Down.frm",
        Func    = "SkeletonArcher_DownDownFunc",
		IsFallDownMotion    = TRUE,
		
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "SkeletonArcher_Down_Special01.frm",
        Func    = "SkeletonArcher_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "SkeletonArcher_Down_Special02.frm",
        Func    = "SkeletonArcher_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "SkeletonArcher_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "SkeletonArcher_Die01.frm",
        Func    = "SkeletonArcher_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "SkeletonArcher_Die02.frm",
        Func    = "SkeletonArcher_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "SkeletonArcher_Standup.frm",
        Func    = "SkeletonArcher_StandupFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ������
    {
        ID      = "STANDUP_ATTACK",
        Motion  = "SkeletonArcher_StandupAttack.frm",
        Func    = "SkeletonArcher_StandupAttackFunc",
    },  
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "SkeletonArcher_Stone.frm",
        Func    = "SkeletonArcher_StoneCurseFunc",
    },    
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "SkeletonArcher_Stone.frm",
        Func    = "SkeletonArcher_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "SkeletonArcher_Stone.frm",
		Func	= "SkeletonArcher_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnSkeletonArcher_Land",
    Die     = "OnSkeletonArcher_Die",
    Damage  = "OnSkeletonArcher_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitSkeletonArcher( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function SkeletonArcher_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- �ȱ� ����
function SkeletonArcher_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function SkeletonArcher_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �״»���
function SkeletonArcher_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LANDING" )
    end
end

-- �״»��� ����
function SkeletonArcher_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function SkeletonArcher_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function SkeletonArcher_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function SkeletonArcher_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ�
function SkeletonArcher_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end		
    end
end

-- �ٿ� �ٿ�
function SkeletonArcher_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 7 ) then
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )		
		pMonster:SetSpeedY( 0.032 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_UP01" )
    end
end

-- �ٿ� �����
function SkeletonArcher_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function SkeletonArcher_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end        		
    end
end

-- �Ͼ��
function SkeletonArcher_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 31 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  ����01 ����
function SkeletonArcher_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 11 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
    elseif( iFrame == 51 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_SKELETONARCHER01, pMonster:GetAngleToTarget() )
		pMonster:PlaySound(218)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����02 ����
function SkeletonArcher_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
   if( iFrame == 11 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
    elseif( iFrame == 51 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_SKELETONARCHER01, pMonster:GetAngleToTarget() )
		pMonster:PlaySound(218)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����03 ����
function SkeletonArcher_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 11 ) then
		pMonster:ComputeAngleToTarget( 0.0, 0.0 ) -- Ÿ�������� ������ ���
    elseif( iFrame == 51 ) then
		pMonster:AddDamageWithAngle( DT_MONSTER_SKELETONARCHER01, pMonster:GetAngleToTarget() )
		pMonster:PlaySound(218)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ȸ�ǰ��� ����
function SkeletonArcher_AvoidAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.4 )
	elseif( iFrame == 31 ) then
		pMonster:PlaySound(218)
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
		pMonster:SetNoCheckContact( 5 )
		pMonster:SetSpeedY( 0.016 )
		pMonster:AddDamageWithAngle( DT_MONSTER_SKELETONARCHER02, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �ʻ�� ����
function SkeletonArcher_SpecialAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 56 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.01 )
		else
			pMonster:SetSpeedX( -0.01 )
		end	
	elseif( iFrame == 58 ) then
		pMonster:AddDamage( DT_LOBSTER_MISSILE )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ���� ����
function SkeletonArcher_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "JUMP" )
    end
end

--  �������� ����
function SkeletonArcher_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ������
function SkeletonArcher_StandupAttackFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 46 ) then
		--pMonster:PlaySound(218)
		pMonster:SetNoCheckContact(10)
		if( pMonster:GetIsRight() ) then
			pMonster:SetSpeedX( 0.01 )
		else
			pMonster:SetSpeedX( -0.01 )
		end		
		pMonster:SetSpeedY( 0.02 )
        pMonster:AddDamage( DT_MONSTER_SKELETON01 )
    elseif( iFrame == 60 ) then
        pMonster:EndAttack(1)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  ����Ŀ�� �ɷ���
function SkeletonArcher_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
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
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function SkeletonArcher_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1) then
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
			pMonster:SetState( "DIE" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function SkeletonArcher_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function SkeletonArcher_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
    
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 200, -600, 400, 600, -300 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function SkeletonArcher_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 160, -200, 200, 200, -200 ) == true ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_RunAway( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 0, -200, 100, 200, -100 ) == true or pMonster:CheckTargetInRange( 0, -150, 300, 150, -300 ) == true  ) then
		pMonster:TurnToTarget()
		
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetIsRight( false )
		else
			pMonster:SetIsRight( true )
		end
    
        pMonster:SetState( "RUNAWAY" )
        pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_RunAwayStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -250, 250, 250, -250 ) == false ) then
    	pMonster:SetSpeedX( 0.0 )
    	pMonster:TurnToTarget()
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function SkeletonArcher_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -100, 150, 100, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -150, 300, 150, 150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -150, -150, 150, -300 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_AvoidAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -300, 150, 300, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:Turn()
		pMonster:SetState( "AVOIDATTACK" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_AvoidAttack2( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( -300, -300, 150, 300, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "AVOIDATTACK" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_SpecialAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 300, -200, 120, 200, -150 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:AddCountValue(-5)
		pMonster:SetState( "SPECIAL_ATTACK" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 300, 100, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		SkeletonArcher_Jump( iMonsterIndex )
		pMonster:SetState( "HIGHJUMP" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, -40, 100, -200 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function SkeletonArcher_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 200, -200, 100, 200, -100 ) == true ) then
			if ( pMonster:FloatRand() < 0.5) then				
				pMonster:SetState( "STANDUP_ATTACK" )
			else
				pMonster:SetState( "STANDUP" )
			end			
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

function SkeletonArcher_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnSkeletonArcher_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )

    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_UP_LANDING" )    
	elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then		
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )    
    end
end

function OnSkeletonArcher_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()
	
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetSpeedX( -0.02 )
		else
			pMonster:SetSpeedX( 0.02 )
		end	
	
		pMonster:SetState( "DIE" )
	end
	
end

function OnSkeletonArcher_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
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

function SkeletonArcher_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * fSpeedX )
	pMonster:SetSpeedY( pMonster:GetWalkSpeed() * fSpeedY )
end

function SkeletonArcher_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.458) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )	
		end
	end
end

function SkeletonArcher_RunAwayMoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
			pMonster:SetNoCheckContact(27)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )
	end
end