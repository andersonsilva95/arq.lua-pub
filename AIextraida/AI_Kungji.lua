-- AI_Kungji.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Kungji_Wait.frm",
        Func    = "Kungji_WaitFunc",

        Trigger =
        {

			-- Ÿ����
            {
                AICheckFrame        = 60,
                AIFunc              = "Kungji_Check_Targeting",
                DelayFrame          = 80,
            },

            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "Kungji_Check_ReleaseTarget",
                DelayFrame          = 150,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "Kungji_Check_TurnToTarget",
                DelayFrame          = 40,
            },

            -- �ȱ�
            {
                AICheckFrame        = 40,
                AIFunc              = "Kungji_Check_Walk",
                DelayFrame          = 40,
            },

            -- ������
            {
                AICheckFrame        = 41,
                AIFunc              = "Kungji_Check_JumpUp",
                DelayFrame          = 100,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 42,
                AIFunc              = "Kungji_Check_JumpDown",
                DelayFrame          = 120,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 200,
                AIFunc              = "Kungji_Check_Idle",
                DelayFrame          = 100,
            },

			-- ��Ʈ ��
            {
                AICheckFrame        = 45,
                AIFunc              = "Kungji_Check_Attack01",
                DelayFrame          = 115,
            },

            -- ������ ű
            {
                AICheckFrame        = 60,
                AIFunc              = "Kungji_Check_Attack02",
                DelayFrame          = 210,
            },

        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Kungji_walk.frm",
        Func            = "Kungji_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Kungji_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 60,
                AIFunc              = "Kungji_Check_Targeting",
                DelayFrame          = 60,
            },
            -- Ÿ������
            {
                AICheckFrame        = 120,
                AIFunc              = "Kungji_Check_ReleaseTarget",
                DelayFrame          = 75,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "Kungji_Check_TurnToTarget",
                DelayFrame          = 30,
            },
            -- ������
            {
                AICheckFrame        = 41,
                AIFunc              = "Kungji_Check_JumpUp",
                DelayFrame          = 80,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 42,
                AIFunc              = "Kungji_Check_JumpDown",
                DelayFrame          = 100,
            },

			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Kungji_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Kungji_Walk.frm",
        Func            = "Kungji_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Kungji_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 60,
                AIFunc              = "Kungji_Check_Targeting",
                DelayFrame          = 60,
            },
            -- ��� ���� [50%]
            {
                AICheckFrame        = 220,
                AIFunc              = "Kungji_Check_Idle_Stop",
                DelayFrame          = 100,
            },
        }
    },
    
    -- �λ�
    {
        ID      = "GREETING",
        Motion  = "Kungji_Wait_action.frm",
        Func    = "Kungji_GreetingFunc",
    },

    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Kungji_Attack01.frm",
        Func    = "Kungji_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "Kungji_Attack02.frm",
        Func    = "Kungji_Attack02Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Kungji_Jump_Up.frm",
        Func    = "Kungji_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Kungji_Jump_Down.frm",
        Func    = "Kungji_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Kungji_Jump_Landing.frm",
        Func    = "Kungji_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Kungji_Damage_Up.frm",
        Func    = "Kungji_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Kungji_Damage_Middle.frm",
        Func    = "Kungji_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Kungji_Damage_Down.frm",
        Func    = "Kungji_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Kungji_Down_Up01.frm",
        Func    = "Kungji_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Kungji_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Kungji_Down_Up02.frm",
        Func    = "Kungji_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Kungji_Down_Up03.frm",
        Func    = "Kungji_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kungji_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Kungji_Down_Middle.frm",
        Func    = "Kungji_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kungji_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Kungji_Down_Middle.frm",
        Func    = "Kungji_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kungji_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Kungji_Down_Special01.frm",
        Func    = "Kungji_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Kungji_Down_Special02.frm",
        Func    = "Kungji_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Kungji_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Kungji_down_middle.frm",
        Func    = "Kungji_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Kungji_Standup.frm",
        Func    = "Kungji_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Kungji_stone.frm",
        Func    = "Kungji_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Kungji_stone.frm",
        Func    = "Kungji_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Kungji_stone.frm",
		Func	= "Kungji_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnKungji_Land",
    Die     = "OnKungji_Die",
    Damage  = "OnKungji_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitKungji( iMonsterIndex )
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
function Kungji_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �λ�~
function Kungji_GreetingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Kungji_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function Kungji_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function Kungji_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function Kungji_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(991001)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Kungji_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Kungji_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Kungji_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Kungji_DownUp03Func( iMonsterIndex, iFrame )
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
function Kungji_DownFunc( iMonsterIndex, iFrame )
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
function Kungji_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Kungji_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Kungji_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Kungji_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 53 ) then
		pMonster:AddDamage( DT_KUNGJI_BIT_PALM )
	elseif( iFrame == 56 ) then
		local posx = 0.2
		local posy = 0.2
		if( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		pMonster:AddParticleNoDirection("Kungji_Punch_01", posx, posy)
		pMonster:PlaySound(991002)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
local fGapX
function Kungji_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 92 ) then
		pMonster:AddDamage(DT_KUNGJI_SHADOW_KICK_1)
	elseif( iFrame == 95 ) then
		pMonster:PlaySound(991003)
		local posx = 0.2
		local posy = 0.1
		local posx2 = -0.05
		local posy2 = 0.0
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02", posx2, posy2)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02_R", posx2, posy2)
		end
	elseif( iFrame == 112 ) then
		pMonster:AddDamage(DT_KUNGJI_SHADOW_KICK_1)
	elseif( iFrame == 115 ) then
		pMonster:PlaySound(991003)
		local posx = 0.2
		local posy = 0.1
		local posx2 = -0.05
		local posy2 = 0.0
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02", posx2, posy2)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02_R", posx2, posy2)
		end
	elseif( iFrame == 132 ) then
		pMonster:AddDamage(DT_KUNGJI_SHADOW_KICK_1)
	elseif( iFrame == 135 ) then
		pMonster:PlaySound(991003)
		local posx = 0.2
		local posy = 0.1
		local posx2 = -0.05
		local posy2 = 0.0
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02", posx2, posy2)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02_R", posx2, posy2)
		end
	elseif( iFrame == 152 ) then
		pMonster:AddDamage(DT_KUNGJI_SHADOW_KICK_2)
	elseif( iFrame == 155 ) then
		pMonster:PlaySound(991003)
		local posx = 0.2
		local posy = 0.1
		local posx2 = -0.05
		local posy2 = 0.0
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02", posx2, posy2)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Kungji_Kick_01", posx, posy)
			pMonster:AddParticleNoDirection("Kungji_Kick_02_R", posx2, posy2)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end


--  ���� ����
function Kungji_JumpFunc( iMonsterIndex, iFrame )
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
function Kungji_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Kungji_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Kungji_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Kungji_IceCurseFunc( iMonsterIndex, iFrame )
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
function Kungji_HoldFunc( iMonsterIndex, iFrame )
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

function Kungji_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -330, 260, 330, -250 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Kungji_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -400, 320, 400, -300 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Kungji_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Kungji_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -150, 460, 150, -400 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Kungji_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -150, 460, 150, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Kungji_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Kungji_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 70, -70, 40, 70, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Kungji_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -120, 40, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Kungji_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 360, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Kungji_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Kungji_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Kungji_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Kungji_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Kungji_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnKungji_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
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

function OnKungji_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnKungji_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		if( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK02" )
		end
	end
end

function Kungji_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:AddCountValue(1)
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Kungji_MoveFail( iMonsterIndex )
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

function Kungji_IdleMoveFail( iMonsterIndex )
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
