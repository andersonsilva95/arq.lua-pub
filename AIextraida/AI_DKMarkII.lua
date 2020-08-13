-- AI_Statue.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Statue_Wait.frm",
        Func    = "Statue_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Statue_Check_Targeting",
                DelayFrame          = 80,
            },

            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Statue_Check_ReleaseTarget",
                DelayFrame          = 220,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 65,
                AIFunc              = "Statue_Check_TurnToTarget",
                DelayFrame          = 65,
            },

            -- �ȱ�
            {
                AICheckFrame        = 50,
                AIFunc              = "Statue_Check_Walk",
                DelayFrame          = 60,
            },

            -- ������
            {
                AICheckFrame        = 50,
                AIFunc              = "Statue_Check_JumpUp",
                DelayFrame          = 50,
            },        

            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Statue_Check_JumpDown",
                DelayFrame          = 50,
            },

			-- �ڵ� ����
            {
                AICheckFrame        = 200,
                AIFunc              = "Statue_Check_Attack02",
                DelayFrame          = 600,
            },

			-- ����
            {
                AICheckFrame        = 200,
                AIFunc              = "Statue_Check_Attack03",
                DelayFrame          = 400,
				DelayFrame1			= 300,
				DelayFrame2			= 200,
				DelayFrame3			= 200,
            },

			-- �Ҵ� ��
            {
                AICheckFrame        = 120,
                AIFunc              = "Statue_Check_Attack04",
                DelayFrame          = 100,
            },

			-- ĳ��
            {
                AICheckFrame        = 51,
                AIFunc              = "Statue_Check_Attack05",
                DelayFrame          = 51,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 150,
                AIFunc              = "Statue_Check_Idle",
                DelayFrame          = 300,
            },
        },
    },

	-- WAIT TO RUN
    {
        ID      = "WALK_READY",
        Motion  = "Statue_Wait_Run.frm",
        Func    = "Statue_WalkReadyFunc",
    },
    
    -- RUN TO WAIT
    {
        ID      = "WALK_END",
        Motion  = "Statue_Run_Wait.frm",
        Func    = "Statue_WalkEndFunc",
    },
    
    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Statue_Run.frm",
        Func            = "Statue_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Statue_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 40,
                AIFunc              = "Statue_Check_Targeting",
                DelayFrame          = 80,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Statue_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "Statue_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- ������
            {
                AICheckFrame        = 50,
                AIFunc              = "Statue_Check_JumpUp",
                DelayFrame          = 50,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "Statue_Check_JumpDown",
                DelayFrame          = 50,
            },
			-- �Ҵ� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "Statue_Check_Attack04",
                DelayFrame          = 100,
            },
            -- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Statue_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Statue_Walk.frm",
        Func            = "Statue_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Statue_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 30,
                AIFunc              = "Statue_Check_Targeting",
                DelayFrame          = 30,
            },
            -- ������(����)
            {
                AICheckFrame        = 220,
                AIFunc              = "Statue_Check_Idle_Stop",
                DelayFrame          = 220,
            },
        }
    },
        
    -- ����
    {
        ID      = "ATTACK01",
        Motion  = "Statue_Attack01.frm",
        Func    = "Statue_Attack01Func",
    },
    
    -- ��ȯ
    {
        ID      = "ATTACK02",
        Motion  = "Statue_Attack02.frm",
        Func    = "Statue_Attack02Func",
    },
    
    -- ���� ����ź
    {
        ID      = "ATTACK03",
        Motion  = "Statue_Attack03.frm",
        Func    = "Statue_Attack03Func",
    },
    
    -- 3����
    {
        ID      = "ATTACK05",
        Motion  = "Statue_Attack03.frm",
        Func    = "Statue_Attack05Func",
    },
    
    -- ����Ʈ�� ��
    {
        ID      = "ATTACK04",
        Motion  = "Statue_Attack04.frm",
        Func    = "Statue_Attack04Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Statue_Jump.frm",
        Func    = "Statue_JumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Statue_Damage_Up.frm",
        Func    = "Statue_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Statue_Damage_Middle.frm",
        Func    = "Statue_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Statue_Damage_Down.frm",
        Func    = "Statue_DamageFunc",
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Statue_Die.frm",
        Func    = "Statue_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Statue_Standup.frm",
        Func    = "Statue_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Statue_Stone.frm",
        Func    = "Statue_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Statue_Stone.frm",
        Func    = "Statue_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Statue_Stone.frm",
		Func	= "Statue_HoldFunc",
	},
	
	-- ��󸶿� �ױ�
    {
        ID      = "DIE_LANDING_DRAMA",
        Motion  = "Statue_Die.frm",
        Func    = "Statue_DieLandingDramaFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "OnStatue_Land",
    Die     = "OnStatue_Die",
    Damage  = "OnStatue_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitStatue( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_DOWN" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    pMonster:RegisterSummonMonsterType( MON_GIANT_WORM )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Statue_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- �ȱ� ���� ����
function Statue_WalkReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �ȱ� �� ����
function Statue_WalkEndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Statue_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
    if( iFrame == 2 ) then
		local posx = 0.3
		if( pMonster:GetIsRight() == false ) then
			pMonster:AddParticleNoDirection( "Dk_Mark-II_Scratch_01_R", -posx, 0.0 )
		else
			pMonster:AddParticleNoDirection( "Dk_Mark-II_Scratch_01", posx, 0.0 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function Statue_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function Statue_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function Statue_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:SetState("ATTACK01")
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end


-- ��󸶿� �ױ�
function Statue_DieLandingDramaFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then		
		
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end



-- ������ ������
function Statue_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Statue_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Statue_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Statue_DownUp03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 5 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end    		
    end
end

-- �ٿ� �̵�
function Statue_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		
		
    end
    
    if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

-- �ٿ� �����
function Statue_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Statue_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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

-- �Ͼ��
function Statue_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����
function Statue_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:AddTraceParticleOffset( "Dk_Mark_II_Bomb_Spark_01", 0, 0.3, 1.0)
		pMonster:AddTraceParticleOffset( "Dk_Mark_II_Bomb_Spark_02", 0, 0.3, 1.0)
	elseif( iFrame == 30 ) then
		pMonster:PlaySound(996027)
	elseif( iFrame == 65 ) then
		pMonster:AddDamage( DT_DKMARK_II_SUICIDAL )
    elseif( iFrame >= pMonster:GetLastFrame() ) then	
        pMonster:SetFrameLock( true )
        pMonster:EndMonster()
    end

end

--  ���̾�Ʈ �� ��ȯ
function Statue_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:SetSpeedX( 0.0)
	
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 35 ) then
		local posy = 0.0
		pMonster:AddTraceParticleOffset( "Dk_Mark_II_Healing_01", 0, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Dk_Mark_II_Healing_02", 0, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Dk_Mark_II_Healing_03", 0, posy, 1.0)
		pMonster:AddTraceParticleOffset( "Dk_Mark_II_Healing_04", 0, posy, 1.0)
		pMonster:PlaySound(996028)
	elseif( iFrame > 35 and iFrame <= 100 ) then
		pMonster:SetHP( pMonster:GetHP() + (pMonster:GetMaxHP() * 0.005) )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end

end

--  ���� ����ź
function Statue_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 60 ) then
		pMonster:PlaySound(996030)
		local posy = 0.3
		local posx = 0.5
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Statue_Homing_Shot_01", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03", posx, posy )
		else
			pMonster:AddParticle( "Statue_Homing_Shot_01_R",posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03_R", posx, posy )
		end
	elseif( iFrame == 63 ) then
		pMonster:AddDamage( DT_DKMARK_II_TOYHOMMING )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  3����
function Statue_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 55 ) then
		local posy = 0.3
		local posx = 0.5
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Statue_Homing_Shot_01", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03", posx, posy )
		else
			pMonster:AddParticle( "Statue_Homing_Shot_01_R",posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_02", posx, posy )
			pMonster:AddParticle( "Statue_Homing_Shot_03_R", posx, posy )
		end
    elseif( iFrame == 60 ) then
		pMonster:PlaySound(996029)
	elseif( iFrame == 63 ) then
	    pMonster:AddDamageWithLocateAngle( DT_DKMARK_II_CANON, -0.25, 0.0, false, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ����Ʈ�� ��
function Statue_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 76 ) then
		pMonster:PlaySound(996031)
		pMonster:AddDamageWithLocate(DT_DKMARK_II_SONICBOMB, 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ���� ����
function Statue_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 2 ) then
		local posy = -0.1
		local posx = 0.0
		
		pMonster:AddParticle( "Dk_Mark-II_Jump_01", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end

end

--  ����Ŀ�� �ɷ���
function Statue_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Statue_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function Statue_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_LANDING" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Statue_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:CheckTargetInRange( 100, -400, 200, 400, -100 )
	pMonster:CheckTargetInRange( 0, -200, 400, 200, -200 )
    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Statue_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -800, 600, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Statue_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Statue_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 700, -200, 100, 200, -100 ) == true and pMonster:FloatRand() < 0.8) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK_READY" )
			pMonster:ResetDelay()
	end
end

function Statue_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 160, 200, -240 ) == true ) then
	
		if ( pMonster:FloatRand() < 0.8) then				
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WALK_END" )
		end
		
		pMonster:ResetDelay()
	end
end

function Statue_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Statue_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetHP() < pMonster:GetMaxHP() * 0.7 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:AddCountValue(-5)
		pMonster:ResetDelay()
	end
end

function Statue_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -400, 400, 400, -300 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -200, 200, 200, -160 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 450, -250, 80, 250, -100 ) == true ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -250, 520, 250, 120 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Statue_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Statue_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -250, -120, 250, -500 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Statue_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -130, 100, 130, -140 ) == true ) then
		if ( pMonster:FloatRand() < 0.6 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end


function Statue_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Statue_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Statue_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false and pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnStatue_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
	elseif( pMonster:CheckState( "DIE_LANDING" ) == true ) then
		pMonster:SetState( "ATTACK01" )
    end

	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

function OnStatue_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnStatue_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedY(0)
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	if ( pMonster:FloatRand() < 0.1 ) then	
		pMonster:SetState( "ATTACK04" )
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

function Statue_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	if ( (fTargetY - fMonY) == 0.0 ) then
		fTargetY = fMonY + 0.1
	end
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Statue_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
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

function Statue_IdleMoveFail( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetIsRight() == true ) then
            pMonster:SetIsRight( false )
            pMonster:SetSpeedX( -0.005 )        
        else
            pMonster:SetIsRight( true )
            pMonster:SetSpeedX( 0.005 )        
        end    
        
        pMonster:SetState( "IDLE" )			        
	end
end
