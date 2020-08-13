-- AI_OrcLordBoss.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Warrior_Orc_Wait.frm",
        Func    = "OrcLordBoss_WaitFunc",

        Trigger =
        {

			-- Ÿ����
            {
                AICheckFrame        = 25,
                AIFunc              = "OrcLordBoss_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "OrcLordBoss_Check_ReleaseTarget",
                DelayFrame          = 55,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "OrcLordBoss_Check_TurnToTarget",
                DelayFrame          = 35,
            },
            -- ��������
            {
                AICheckFrame        = 250,
                AIFunc              = "OrcLordBoss_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ����
            {
                AICheckFrame        = 75,
                AIFunc              = "OrcLordBoss_Check_Rush",
                DelayFrame          = 220,
            },            
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "OrcLordBoss_Check_Attack03",
                DelayFrame          = 220,
            },
            -- �׶��� �극��ũ
            {
                AICheckFrame        = 45,
                AIFunc              = "OrcLordBoss_Check_Attack06",
                DelayFrame          = 550,
            },
            -- �ȱ�
            {
                AICheckFrame        = 55,
                AIFunc              = "OrcLordBoss_Check_Walk",
                DelayFrame          = 75,
            },
            -- ��������
            {
                AICheckFrame        = 55,
                AIFunc              = "OrcLordBoss_Check_HighJump",
                DelayFrame          = 55,
            },

            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "OrcLordBoss_Check_JumpDown",
                DelayFrame          = 100,
            },
        },
    },

    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Warrior_Orc_Walk.frm",
        Func    = "OrcLordBoss_WalkFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "OrcLordBoss_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 25,
                AIFunc              = "OrcLordBoss_Check_Targeting",
                DelayFrame          = 110,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 55,
                AIFunc              = "OrcLordBoss_Check_TurnToTarget",
                DelayFrame          = 55,
            },            
            -- ��������
            {
                AICheckFrame        = 250,
                AIFunc              = "OrcLordBoss_Check_Attack01",
                DelayFrame          = 110,
            },
            -- ����
            {
                AICheckFrame        = 55,
                AIFunc              = "KnightOrcBoss_Check_Run",
                DelayFrame          = 220,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "OrcLordBoss_Check_HighJump",
                DelayFrame          = 55,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "OrcLordBoss_Check_JumpDown",
                DelayFrame          = 55,
            },
        }
    },
    
    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "Warrior_Orc_Attack01.frm",
        Func    = "OrcLordBoss_Attack01Func",
    },
    
    -- ��������02
    {
        ID      = "ATTACK02",
        Motion  = "Warrior_Orc_Attack02.frm",
        Func    = "OrcLordBoss_Attack02Func",
    },
    
    -- ����
    {
        ID      = "RUSH",
        Motion  = "Warrior_Orc_Run.frm",
        Func    = "OrcLordBoss_RushFunc",
    },
    
    -- ��������
    {
        ID      = "ATTACK03",
        Motion  = "Warrior_Orc_Attack07.frm",
        Func    = "OrcLordBoss_Attack03Func",
    },
    
    -- �׶��� �극��ũ
    {
        ID      = "ATTACK06",
        Motion  = "Warrior_Orc_Attack06.frm",
        Func    = "OrcLordBoss_Attack06Func",
    },
    
     -- ī��Ʈ����
    {
        ID      = "ATTACK05",
        Motion  = "Warrior_Orc_Attack05.frm",
        Func    = "OrcLordBoss_Attack05Func",
    },
    
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Warrior_Orc_Jump_up.frm",
        Func    = "OrcLordBoss_JumpFunc",
    },
    
        -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Warrior_Orc_Jump_down.frm",
        Func    = "KnightOrcBoss_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Warrior_Orc_Jump_Landing.frm",
        Func    = "KnightOrcBoss_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Warrior_Orc_Damage_Up.frm",
        Func    = "OrcLordBoss_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Warrior_Orc_Damage_Middle.frm",
        Func    = "OrcLordBoss_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Warrior_Orc_Damage_Down.frm",
        Func    = "OrcLordBoss_DamageFunc",
    },
    
    -- �ٿ� ��01
    {
        ID      = "DOWN_UP01",
        Motion  = "Warrior_Orc_Down_Up01.frm",
        Func    = "OrcLordBoss_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "OrcLordBoss_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Warrior_Orc_Down_Up02.frm",
        Func    = "OrcLordBoss_DownUpFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Warrior_Orc_Down_Up03.frm",
        Func    = "OrcLordBoss_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "OrcLordBoss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �� 
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Warrior_Orc_Down_Up03.frm",
        Func    = "OrcLordBoss_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "OrcLordBoss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �� 
    {
        ID      = "DOWN_DOWN",
        Motion  = "Warrior_Orc_Down_Up03.frm",
        Func    = "OrcLordBoss_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "OrcLordBoss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
     -- �ٿ� ����� 
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Warrior_Orc_Down_Special01.frm",
        Func    = "KnightOrcBoss_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Warrior_Orc_Down_Special02.frm",
        Func    = "KnightOrcBoss_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "OrcLordBoss_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Warrior_Orc_Standup.frm",
        Func    = "OrcLordBoss_StandupFunc",
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Warrior_Orc_lord_Die.frm",
        Func    = "OrcLordBoss_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Warrior_Orc_lord_Die.frm",
        Func    = "OrcLordBoss_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Warrior_Orc_Stone.frm",
        Func    = "OrcLordBoss_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Warrior_Orc_Stone.frm",
        Func    = "OrcLordBoss_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Warrior_Orc_Stone.frm",
		Func	= "OrcLordBoss_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnOrcLordBoss_Land",
    Die     = "OnOrcLordBoss_Die",
    Damage  = "OnOrcLordBoss_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitOrcLordBoss( iMonsterIndex )
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
function OrcLordBoss_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

function OrcLordBoss_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -1100, 900, 1100, -900 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end


-- �ȱ� ����
function OrcLordBoss_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

-- ���� ����
function OrcLordBoss_RushFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
		if( iFrame == 1 ) then
			pMonster:SkillReadyEffect( 64, 128, 64, 0.4 )
		end
	elseif( iFrame == 14 ) then
		pMonster:SkillReadyEffect( 128, 128, 128, 0.4 )
    elseif( iFrame >= 21 and iFrame < 91 ) then
		if( iFrame == 23 ) then
			pMonster:AddDamage( DT_MONSTER_KNIGHTORC03 )
		end
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 2.0 )
	elseif( iFrame == 91 ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������01 ����
function OrcLordBoss_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 63 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.0 )
		pMonster:AddDamage( DT_MONSTER_KNIGHTORC01 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��������02 ����
function OrcLordBoss_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 50 ) then		
		pMonster:AddDamage( DT_MONSTER_ORCLORD01 )
		pMonster:PlaySound(997001)
	elseif( iFrame == 82 ) then
		pMonster:AddDamage( DT_MONSTER_ORCLORD02 )
		pMonster:PlaySound(997001)
	elseif( iFrame == 117 ) then
		pMonster:AddDamage( DT_MONSTER_KNIGHTORC02 )
		pMonster:PlaySound(997002)
	elseif( iFrame == 125 ) then
		pMonster:EarthQuakeWithRange( 25, 0.04, 0.01, 1.3 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �����(��������) ����
function OrcLordBoss_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:StartText("JUMP")
    elseif( iFrame == 63 ) then
        pMonster:AddDamage( DT_MONSTER_KNIGHTORC02 )
    elseif( iFrame == 71 ) then
		pMonster:EarthQuake( 30, 0.06, 0.04 )
	elseif( iFrame == 73 ) then
		pMonster:PlaySound( "47" )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ī��Ʈ���� ����
function OrcLordBoss_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 79 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 5.0 )
	elseif( iFrame == 81 ) then
		pMonster:AddDamage( DT_MONSTER_KNIGHTORC01 )
	elseif( iFrame == 100 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �׶��� �극��ũ ����
function OrcLordBoss_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 61 ) then
        pMonster:SkillReadyEffectNoStop( 220, 220, 220, 0.0 )
    elseif( iFrame == 81 ) then
        pMonster:AddDamage( DT_MONSTER_KNIGHTORC02 )
    elseif( iFrame == 89 ) then
		--pMonster:CameraVib( false, 1.0, 1.0 )
	elseif( iFrame == 91 ) then
		pMonster:PlaySound( "47" )
		pMonster:AddDamageWithLocate( DT_MONSTER_ORCLORD_SPECIAL01, 0.8, 0.0 )
		pMonster:AddParticle( "Broken_Ground02", 0.8, 0.1 )		
		pMonster:AddParticle( "Broken_Ground03", 0.8, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 0.8, 0.1 )		
	elseif( iFrame == 101 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_ORCLORD_SPECIAL01, 1.05, 0.0 )
		pMonster:AddParticle( "Broken_Ground02", 1.05, 0.1 )		
		pMonster:AddParticle( "Broken_Ground03", 1.05, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 1.05, 0.1 )		
	elseif( iFrame == 111 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_ORCLORD_SPECIAL01, 1.3, 0.0 )
		pMonster:AddParticle( "Broken_Ground02", 1.3, 0.1 )		
		pMonster:AddParticle( "Broken_Ground03", 1.3, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 1.3, 0.1 )		
	elseif( iFrame == 121 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_ORCLORD_SPECIAL01, 1.45, 0.0 )
		pMonster:AddParticle( "Broken_Ground02", 1.45, 0.1 )		
		pMonster:AddParticle( "Broken_Ground03", 1.45, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 1.45, 0.1 )		
	elseif( iFrame == 131 ) then
		pMonster:AddDamageWithLocate( DT_MONSTER_ORCLORD_SPECIAL01, 1.7, 0.0 )
		pMonster:AddParticle( "Broken_Ground02", 1.7, 0.1 )		
		pMonster:AddParticle( "Broken_Ground03", 1.7, 0.1 )		
		pMonster:AddParticle( "Broken_Ground04", 1.7, 0.1 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- ���� ����
function OrcLordBoss_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function KnightOrcBoss_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function KnightOrcBoss_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �״»���
function OrcLordBoss_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(994009)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function OrcLordBoss_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ�
function OrcLordBoss_DownFunc( iMonsterIndex, iFrame )
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

-- �ٿ� ����� ����
function KnightOrcBoss_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function KnightOrcBoss_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        if( pMonster:GetHP() <= 0 ) then
            pMonster:SetState( "DIE_LANDING" )
        end
    end
end

-- �ٿ� ��
function OrcLordBoss_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �Ͼ��
function OrcLordBoss_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame < 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	elseif( iFrame == 25 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )        
    end
end


--  ����Ŀ�� �ɷ���
function OrcLordBoss_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function OrcLordBoss_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_medium", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function OrcLordBoss_HoldFunc( iMonsterIndex, iFrame )
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

function OrcLordBoss_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function OrcLordBoss_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -200, 600, 200, -600 ) == false ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "WALK" )
            pMonster:ResetDelay()
		end
    end
end

function OrcLordBoss_Check_Rush( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -400, 200, 400, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetCountValue() >= 3 ) then
			pMonster:TurnToTarget()
            pMonster:SetState( "RUSH" )
            pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -300, 600, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		OrcLordBoss_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

   if( pMonster:CheckTargetInRange( 60, -100, -100, 100, -1000 ) == true ) then
        pMonster:SetNoCheckContact(30)
        pMonster:SetIgnoreFHCheck(true)
        pMonster:SetSpeedY( 0.01 )            
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 130, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 400, -200, 300, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -400, 400, 400, -450 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function OrcLordBoss_Check_Attack06( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 500, -300, 200, 300, -100 ) == true and pMonster:GetCountValue() >= 5 ) then
		pMonster:SetCountValue(0)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK06" )
		pMonster:ResetDelay()
    end
end

function OrcLordBoss_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function OrcLordBoss_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnOrcLordBoss_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "JUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end    
end

function OnOrcLordBoss_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end	
end

function OnOrcLordBoss_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )	
	pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 50 + (pMonster:FloatRand() * 50) )		
	end
	
	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.028 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" ) ) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.019 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_UP02" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.03 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			pMonster:SetSuperArmor(true)
            pMonster:SetState( "ATTACK05" )
		end
    end
end

function OrcLordBoss_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.1)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 5.0))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function OrcLordBoss_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.0) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(40)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.042 )			
		else
			pMonster:SetNoCheckContact(30)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.0120)			
		end
	end
end
