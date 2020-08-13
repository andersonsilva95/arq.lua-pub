-- AI_Black_Wood_Scout.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Black_Wood_Scout_Wait.frm",
        Func    = "Black_Wood_Scout_WaitFunc",

        Trigger =
        {

			-- Ÿ����
            {
                AICheckFrame        = 50,
                AIFunc              = "Black_Wood_Scout_Check_Targeting",
                DelayFrame          = 80,
            },

            -- Ÿ������
            {
                AICheckFrame        = 100,
                AIFunc              = "Black_Wood_Scout_Check_ReleaseTarget",
                DelayFrame          = 50,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "Black_Wood_Scout_Check_TurnToTarget",
                DelayFrame          = 15,
            },

            -- �ȱ�
            {
                AICheckFrame        = 50,
                AIFunc              = "Black_Wood_Scout_Check_Walk",
                DelayFrame          = 5,
            },

            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Black_Wood_Scout_Check_JumpUp",
                DelayFrame          = 30,
            },        

            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "Black_Wood_Scout_Check_JumpDown",
                DelayFrame          = 20,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 40,
                AIFunc              = "Black_Wood_Scout_Check_Idle",
                DelayFrame          = 20,
            },

			-- ���� �转 [60%]
            {
                AICheckFrame        = 25,
                AIFunc              = "Black_Wood_Scout_Check_Attack01",
                DelayFrame          = 120,
            },

			-- �����̽� ���� [75%]
            {
                AICheckFrame        = 20,
                AIFunc              = "Black_Wood_Scout_Check_Attack02",
                DelayFrame          = 80,
            },

        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Black_Wood_Scout_Run.frm",
        Func            = "Black_Wood_Scout_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Black_Wood_Scout_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 50,
                AIFunc              = "Black_Wood_Scout_Check_Targeting",
                DelayFrame          = 40,
            },
            -- Ÿ������
            {
                AICheckFrame        = 50,
                AIFunc              = "Black_Wood_Scout_Check_ReleaseTarget",
                DelayFrame          = 50,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 10,
                AIFunc              = "Black_Wood_Scout_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Black_Wood_Scout_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 35,
                AIFunc              = "Black_Wood_Scout_Check_JumpDown",
                DelayFrame          = 20,
            },

			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Black_Wood_Scout_Check_Stop",
                DelayFrame          = 40,
            },

			-- ������(�̵�)
            {
                AICheckFrame        = 40,
                AIFunc              = "Black_Wood_Scout_Check_Idle",
                DelayFrame          = 60,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Black_Wood_Scout_Walk.frm",
        Func            = "Black_Wood_Scout_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Black_Wood_Scout_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 40,
                AIFunc              = "Black_Wood_Scout_Check_Targeting",
                DelayFrame          = 110,
            },

            -- ������(����)
            {
                AICheckFrame        = 220,
                AIFunc              = "Black_Wood_Scout_Check_Idle_Stop",
                DelayFrame          = 100,
            },
        }
    },

    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Black_Wood_Scout_Attack01.frm",
        Func    = "Black_Wood_Scout_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "Black_Wood_Scout_Attack02.frm",
        Func    = "Black_Wood_Scout_Attack02Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Black_Wood_Scout_Jump_Up.frm",
        Func    = "Black_Wood_Scout_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Black_Wood_Scout_Jump_Down.frm",
        Func    = "Black_Wood_Scout_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Black_Wood_Scout_Jump_Landing.frm",
        Func    = "Black_Wood_Scout_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Black_Wood_Scout_Damage_Up.frm",
        Func    = "Black_Wood_Scout_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Black_Wood_Scout_Damage_Middle.frm",
        Func    = "Black_Wood_Scout_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Black_Wood_Scout_Damage_Down.frm",
        Func    = "Black_Wood_Scout_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Black_Wood_Scout_Down_Up01.frm",
        Func    = "Black_Wood_Scout_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Black_Wood_Scout_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Black_Wood_Scout_Down_Up02.frm",
        Func    = "Black_Wood_Scout_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Black_Wood_Scout_Down_Up03.frm",
        Func    = "Black_Wood_Scout_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Black_Wood_Scout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Black_Wood_Scout_Down_Middle.frm",
        Func    = "Black_Wood_Scout_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Black_Wood_Scout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Black_Wood_Scout_Down_Middle.frm",
        Func    = "Black_Wood_Scout_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Black_Wood_Scout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Black_Wood_Scout_Down_Special01.frm",
        Func    = "Black_Wood_Scout_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Black_Wood_Scout_Down_Special02.frm",
        Func    = "Black_Wood_Scout_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Black_Wood_Scout_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Black_Wood_Scout_down_middle.frm",
        Func    = "Black_Wood_Scout_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Black_Wood_Scout_Standup.frm",
        Func    = "Black_Wood_Scout_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Black_Wood_Scout_Stone.frm",
        Func    = "Black_Wood_Scout_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Black_Wood_Scout_Stone.frm",
        Func    = "Black_Wood_Scout_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Black_Wood_Scout_Stone.frm",
		Func	= "Black_Wood_Scout_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnBlack_Wood_Scout_Land",
    Die     = "OnBlack_Wood_Scout_Die",
    Damage  = "OnBlack_Wood_Scout_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitBlack_Wood_Scout( iMonsterIndex )
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
	pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Black_Wood_Scout_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 and pMonster:GetCountValue() == 0 ) then
		pMonster:SetCountValue(1)
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_01", posx, posy )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_02", posx, posy )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_03", posx, posy )
		pMonster:AddParticleNoDirection( "Blackwood_Assassin_Dash_04", posx, posy )

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Black_Wood_Scout_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function Black_Wood_Scout_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function Black_Wood_Scout_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function Black_Wood_Scout_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(992001)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Black_Wood_Scout_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Black_Wood_Scout_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Black_Wood_Scout_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Black_Wood_Scout_DownUp03Func( iMonsterIndex, iFrame )
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
function Black_Wood_Scout_DownFunc( iMonsterIndex, iFrame )
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
function Black_Wood_Scout_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Black_Wood_Scout_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Black_Wood_Scout_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
local fGapX
function Black_Wood_Scout_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= 58 and iFrame <= 66 ) then
		if ( iFrame == 58 ) then
			pMonster:TurnToTarget()
			fGapX = (pMonster:GetTargetX() - pMonster:GetX()) / 10
		elseif( iFrame == 65 ) then
			pMonster:AddDamage(DT_BLACKWOOD_SCOUT_BLOODBASH)
			pMonster:PlaySound(992002)
		elseif( iFrame == 66 ) then
			pMonster:SetSpeedX( 0 )
			local posx = 0.3
			local posy = 0.2
			if( pMonster:GetIsRight() ) then
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_01", posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_02", posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_03", posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_04", posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_05", posx, posy )
			else
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_01", -posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_02", -posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_03_R", -posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_04_R", -posx, posy )
				pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_05", -posx, posy )
			end
		end
		
		if( iFrame < 66 ) then
			pMonster:SetSpeedX(fGapX)
		end
	elseif( iFrame == 96 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_BLOODBASH_FANAL)
	elseif( iFrame == 99 ) then
		local posx = 0.1
		local posy = 0.2
		if( false == pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_01", -posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_02", -posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_03", -posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_04", -posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_05", -posx, posy )
		else
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_01", posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_02", posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_03_R", posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_04_R", posx, posy )
			pMonster:AddParticleNoDirection("Blackwood_Scout_Bash_05", posx, posy )
		end
		pMonster:PlaySound(992002)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
function Black_Wood_Scout_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 62 ) then
		local posx = 0.3
		local posy = 0.2
		pMonster:AddParticle("Blackwood_Scout_Slice", posx, posy )
		pMonster:AddParticle("Blackwood_Scout_Bash_01", posx, posy )
		pMonster:AddParticle("Blackwood_Scout_Bash_02", posx, posy )
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK)
	elseif( iFrame == 70 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK_2)
		pMonster:PlaySound(992003)
	elseif( iFrame == 82 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK)
		pMonster:PlaySound(992003)
	elseif( iFrame == 90 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK)
		pMonster:PlaySound(992003)
	elseif( iFrame == 102 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK)
		pMonster:PlaySound(992003)
	elseif( iFrame == 108 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK_2)
		pMonster:PlaySound(992003)
	elseif( iFrame == 118 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK)
		pMonster:PlaySound(992003)
	elseif( iFrame == 132 ) then
		pMonster:AddDamage(DT_BLACKWOOD_SCOUT_SLICEATTACK_3)
		pMonster:PlaySound(992003)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ���� ����
function Black_Wood_Scout_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function Black_Wood_Scout_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Black_Wood_Scout_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Black_Wood_Scout_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Black_Wood_Scout_IceCurseFunc( iMonsterIndex, iFrame )
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
function Black_Wood_Scout_HoldFunc( iMonsterIndex, iFrame )
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

function Black_Wood_Scout_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 110, -330, 260, 330, -250 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Black_Wood_Scout_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -500, 400, 500, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Black_Wood_Scout_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Black_Wood_Scout_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 400, -200, 360, 200, -400 ) == true and pMonster:FloatRand() < 0.75) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function Black_Wood_Scout_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 60, -200, 360, 200, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Black_Wood_Scout_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Black_Wood_Scout_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -100, 50, 100, -100 ) == true and pMonster:FloatRand() < 0.6 ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Black_Wood_Scout_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -100, 50, 100, -100 ) == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Black_Wood_Scout_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 360, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Black_Wood_Scout_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Black_Wood_Scout_Check_JumpDown( iMonsterIndex, iFrame )
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

function Black_Wood_Scout_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Black_Wood_Scout_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Black_Wood_Scout_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnBlack_Wood_Scout_Land( iMonsterIndex )
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

function OnBlack_Wood_Scout_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnBlack_Wood_Scout_Damage( iMonsterIndex )
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
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.08 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK01" )
		end
	end
end

function Black_Wood_Scout_Jump( iMonsterIndex )
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

function Black_Wood_Scout_MoveFail( iMonsterIndex )
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

function Black_Wood_Scout_IdleMoveFail( iMonsterIndex )
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
