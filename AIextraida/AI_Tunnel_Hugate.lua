-- AI_Tunnel_Hugate.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Tunnel_Hugate_Wait.frm",
        Func    = "Tunnel_Hugate_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 40,
                AIFunc              = "Tunnel_Hugate_Check_Targeting",
                DelayFrame          = 80,
            },

            -- Ÿ������
            {
                AICheckFrame        = 350,
                AIFunc              = "Tunnel_Hugate_Check_ReleaseTarget",
                DelayFrame          = 250,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "Tunnel_Hugate_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- �ȱ�
            {
                AICheckFrame        = 50,
                AIFunc              = "Tunnel_Hugate_Check_Walk",
                DelayFrame          = 25,
            },

            -- ������
            {
                AICheckFrame        = 32,
                AIFunc              = "Tunnel_Hugate_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 21,
                AIFunc              = "Tunnel_Hugate_Check_JumpDown",
                DelayFrame          = 20,
            },

            -- ������(�̵�)
            {
                AICheckFrame        = 150,
                AIFunc              = "Tunnel_Hugate_Check_Idle",
                DelayFrame          = 50,
            },

			-- �÷��� ��
            {
                AICheckFrame        = 10,
                AIFunc              = "Tunnel_Hugate_Check_Attack01",
                DelayFrame          = 110,
            },

            -- ���� �ҵ�
            {
                AICheckFrame        = 22,
                AIFunc              = "Tunnel_Hugate_Check_Attack02",
                DelayFrame          = 132,
            },
        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Tunnel_Hugate_walk.frm",
        Func            = "Tunnel_Hugate_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Tunnel_Hugate_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 30,
                AIFunc              = "Tunnel_Hugate_Check_Targeting",
                DelayFrame          = 40,
            },
            -- Ÿ������
            {
                AICheckFrame        = 250,
                AIFunc              = "Tunnel_Hugate_Check_ReleaseTarget",
                DelayFrame          = 250,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "Tunnel_Hugate_Check_TurnToTarget",
                DelayFrame          = 10,
            },
            -- ������
            {
                AICheckFrame        = 16,
                AIFunc              = "Tunnel_Hugate_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 15,
                AIFunc              = "Tunnel_Hugate_Check_JumpDown",
                DelayFrame          = 20,
            },

			-- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Hugate_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
    
     -- ������
    {
        ID              = "IDLE",
        Motion          = "Tunnel_Hugate_Walk.frm",
        Func            = "Tunnel_Hugate_IdleFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Tunnel_Hugate_IdleMoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 20,
                AIFunc              = "Tunnel_Hugate_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 220,
                AIFunc              = "Tunnel_Hugate_Check_Idle_Stop",
                DelayFrame          = 100,
            },
        }
    },
        
    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Tunnel_Hugate_Attack01.frm",
        Func    = "Tunnel_Hugate_Attack01Func",
    },
    
    -- ��������
    {
        ID      = "ATTACK02",
        Motion  = "Tunnel_Hugate_Attack02.frm",
        Func    = "Tunnel_Hugate_Attack02Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Tunnel_Hugate_Jump_Up.frm",
        Func    = "Tunnel_Hugate_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Tunnel_Hugate_Jump_Down.frm",
        Func    = "Tunnel_Hugate_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Tunnel_Hugate_Jump_Landing.frm",
        Func    = "Tunnel_Hugate_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Tunnel_Hugate_Damage_Up.frm",
        Func    = "Tunnel_Hugate_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Tunnel_Hugate_Damage_Middle.frm",
        Func    = "Tunnel_Hugate_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Tunnel_Hugate_Damage_Down.frm",
        Func    = "Tunnel_Hugate_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Tunnel_Hugate_Down_Up01.frm",
        Func    = "Tunnel_Hugate_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Tunnel_Hugate_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Tunnel_Hugate_Down_Up02.frm",
        Func    = "Tunnel_Hugate_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Tunnel_Hugate_Down_Up03.frm",
        Func    = "Tunnel_Hugate_DownUp03Func",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Hugate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
	
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Tunnel_Hugate_Down_Middle.frm",
        Func    = "Tunnel_Hugate_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Hugate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Tunnel_Hugate_Down_Middle.frm",
        Func    = "Tunnel_Hugate_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Hugate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Tunnel_Hugate_Down_Special01.frm",
        Func    = "Tunnel_Hugate_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Tunnel_Hugate_Down_Special02.frm",
        Func    = "Tunnel_Hugate_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Tunnel_Hugate_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Tunnel_Hugate_down_middle.frm",
        Func    = "Tunnel_Hugate_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Tunnel_Hugate_Standup.frm",
        Func    = "Tunnel_Hugate_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Tunnel_Hugate_stone.frm",
        Func    = "Tunnel_Hugate_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Tunnel_Hugate_stone.frm",
        Func    = "Tunnel_Hugate_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Tunnel_Hugate_stone.frm",
		Func	= "Tunnel_Hugate_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnTunnel_Hugate_Land",
    Die     = "OnTunnel_Hugate_Die",
    Damage  = "OnTunnel_Hugate_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitTunnel_Hugate( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Tunnel_Hugate_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Tunnel_Hugate_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- ������ ����
function Tunnel_Hugate_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
end

-- �׾���
function Tunnel_Hugate_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DIE_LANDING" )
    end
end

-- �ױ� ����
function Tunnel_Hugate_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(993010)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Tunnel_Hugate_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Tunnel_Hugate_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Tunnel_Hugate_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function Tunnel_Hugate_DownUp03Func( iMonsterIndex, iFrame )
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
function Tunnel_Hugate_DownFunc( iMonsterIndex, iFrame )
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
function Tunnel_Hugate_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Tunnel_Hugate_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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
function Tunnel_Hugate_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Tunnel_Hugate_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 70 ) then
		pMonster:PlaySound(993011)

    elseif( iFrame == 80 ) then
		pMonster:AddDamage( DT_TUNNEL_HUGETE_FLASH_CUT )
		
		local posx = 0.4
		local posy = 0.2
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Hugate_Cut_01_R", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Cut_02", posx, posy)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Hugate_Cut_01", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Cut_02", posx, posy)
		end

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
local fGapX
function Tunnel_Hugate_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif ( iFrame == 3 ) then
		fGapX = (pMonster:GetTargetX() - pMonster:GetX()) / 40
		local posx = 0.0
		local posy = 0.0
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
		end
		pMonster:AddTraceParticleToBone( "Hugate_Falcon_06", 1.0, -1, 8, 8, posx, posy, true )
	elseif( iFrame >= 64 and iFrame <= 82 ) then
		if ( iFrame == 64 ) then
			fGapX = (pMonster:GetTargetX() - pMonster:GetX()) / 40
		end
		pMonster:SetSpeedX(fGapX * 1.0)
	elseif( iFrame == 83 ) then
		pMonster:SetSpeedX(pMonster:GetWalkSpeed())
		pMonster:AddDamage(DT_TUNNEL_FALCON_SWORD)
    elseif( iFrame == 84 ) then
		local posx = 0.4
		local posy = 0.2
		if ( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Hugate_Falcon_01", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_02", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_03", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_04", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_05", posx, posy)
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("Hugate_Falcon_01", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_02", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_03", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_04_R", posx, posy)
			pMonster:AddParticleNoDirection("Hugate_Falcon_05_R", posx, posy)
		end
		pMonster:PlaySound(993012)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end


--  ���� ����
function Tunnel_Hugate_JumpFunc( iMonsterIndex, iFrame )
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
function Tunnel_Hugate_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Tunnel_Hugate_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Tunnel_Hugate_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Tunnel_Hugate_IceCurseFunc( iMonsterIndex, iFrame )
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
function Tunnel_Hugate_HoldFunc( iMonsterIndex, iFrame )
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

function Tunnel_Hugate_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -900, 560, 900, -600 ) == true ) then
		pMonster:TurnToTarget()		
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end  
end

function Tunnel_Hugate_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -900, 560, 900, -600 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Tunnel_Hugate_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Tunnel_Hugate_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -210, 560, 210, -600 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Tunnel_Hugate_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -210, 560, 210, -600 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Hugate_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Tunnel_Hugate_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 130, -130, 50, 130, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Hugate_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 350, -120, 50, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Hugate_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 560, 200, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Tunnel_Hugate_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Tunnel_Hugate_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -150, -100, 150, -600 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function Tunnel_Hugate_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-- ������..  ���� �ٲٱ� �� �̵�
function Tunnel_Hugate_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Tunnel_Hugate_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetSpeedX( 0.0 )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnTunnel_Hugate_Land( iMonsterIndex )
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

function OnTunnel_Hugate_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnTunnel_Hugate_Damage( iMonsterIndex )
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
			pMonster:SetSuperArmor( true )
			pMonster:TurnToTarget()
			if( pMonster:CheckTargetInRange( 0, -260, 50, 260, -100 ) == true ) then
				pMonster:SetState( "ATTACK01" )
			else
				pMonster:SetState( "ATTACK02" )
			end
		end
	end
end

function Tunnel_Hugate_Jump( iMonsterIndex )
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

function Tunnel_Hugate_MoveFail( iMonsterIndex )
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

function Tunnel_Hugate_IdleMoveFail( iMonsterIndex )
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
