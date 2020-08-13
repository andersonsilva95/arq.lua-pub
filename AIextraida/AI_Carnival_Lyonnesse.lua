-- AI_Carnival_Lyonnesse.lua

ActionList =
{	
	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Sabertooth_Wait.frm",
        Func    = "Carnival_Lyonnesse_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 35,
                AIFunc              = "Carnival_Lyonnesse_Check_Targeting",
                DelayFrame          = 30,
            },
            
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "Carnival_Lyonnesse_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 95,
				AICheckFrame1       = 55,
				AICheckFrame2       = 25,
                AIFunc              = "Carnival_Lyonnesse_Check_TurnToTarget",
                DelayFrame          = 50,
            },

            -- �̵� [70%]
            {
				AICheckFrame        = 180,
				AICheckFrame1       = 120,
				AICheckFrame2       = 60,
                AIFunc              = "Carnival_Lyonnesse_Check_Walk",
                DelayFrame          = 110,
				DelayFrame1			= 80,
				DelayFrame2			= 55,
            },

            -- ����01
            {
                AICheckFrame        = 110,
				AICheckFrame1       = 70,
				AICheckFrame2       = 45,
                AIFunc              = "Carnival_Lyonnesse_Check_Attack01",
                DelayFrame          = 200,
				DelayFrame1			= 150,
				DelayFrame2			= 100,
            },

            -- ��ġ������
            {
                AICheckFrame        = 150,
				AICheckFrame1       = 90,
				AICheckFrame2       = 65,
                AIFunc              = "Carnival_Lyonnesse_Check_Attack02",
                DelayFrame          = 210,
            },

            -- ����03
            {
                AICheckFrame        = 170,
				AICheckFrame1       = 110,
				AICheckFrame2       = 90,
                AIFunc              = "Carnival_Lyonnesse_Check_Attack03",
                DelayFrame          = 390,
				DelayFrame1			= 290,
				DelayFrame2			= 250,
            },
            
            -- ��������
            {
                AICheckFrame        = 122,
				AICheckFrame1       = 80,
				AICheckFrame2       = 40,
                AIFunc              = "Carnival_Lyonnesse_Check_HighJump",
                DelayFrame          = 120,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 121,
                AIFunc              = "Carnival_Lyonnesse_Check_JumpDown",
                DelayFrame          = 110,
            },
            -- ������(�̵�)
            {
                AICheckFrame        = 110,
                AIFunc              = "Carnival_Lyonnesse_Check_Idle",
                DelayFrame          = 110,
            },
        }
    },

    -- ������
    {
        ID      = "IDLE",
        Motion  = "Sabertooth_Move_Walk.frm",
        Func    = "Carnival_Lyonnesse_IdleFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Carnival_Lyonnesse_IdleMoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "Carnival_Lyonnesse_Check_Targeting",
                DelayFrame          = 110,
            },
            -- ������(����)
            {
                AICheckFrame        = 440,
                AIFunc              = "Carnival_Lyonnesse_Check_Idle_Stop",
                DelayFrame          = 440,
            },
        }
    },
    
    -- �̵�
    {
        ID      = "WALK",
        Motion  = "Sabertooth_Move_Run.frm",
        Func    = "Carnival_Lyonnesse_RunFunc",
        EnableMoveCheck = 1,
        MoveFailFunc    = "Carnival_Lyonnesse_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 55,
                AIFunc              = "Carnival_Lyonnesse_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 330,
                AIFunc              = "Carnival_Lyonnesse_Check_ReleaseTarget",
                DelayFrame          = 660,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 35,
                AIFunc              = "Carnival_Lyonnesse_Check_TurnToTarget",
                DelayFrame          = 50,
            },
            -- ��������
            {
                AICheckFrame        = 80,
                AIFunc              = "Carnival_Lyonnesse_Check_HighJump",
                DelayFrame          = 80,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "Carnival_Lyonnesse_Check_JumpDown",
                DelayFrame          = 110,
            },
			-- ����01
            {
                AICheckFrame        = 440,
				AICheckFrame1       = 320,
				AICheckFrame2       = 200,
                AIFunc              = "Carnival_Lyonnesse_Check_Attack01",
                DelayFrame          = 500,
            },
             -- ����
            {
                AICheckFrame        = 10,
                AIFunc              = "Carnival_Lyonnesse_Check_WalkStop",
                DelayFrame          = 10,
            },
            -- ����03
            {
                AICheckFrame        = 330,
				AICheckFrame1       = 220,
				AICheckFrame2       = 110,
				AICheckFrame3       = 110,
                AIFunc              = "Carnival_Lyonnesse_Check_Attack03",
                DelayFrame          = 220,
            },
        }
    },
    
    -- ����01 �qŰ��!
    {
        ID      = "ATTACK01",
        Motion  = "Sabertooth_Attack02.frm",
        Func    = "Carnival_Lyonnesse_Attack01Func",
    },
    
    -- ����02 ǥȿ
    {
        ID      = "ATTACK02",
        Motion  = "Sabertooth_Attack01.frm",
        Func    = "Carnival_Lyonnesse_Attack02Func",
    },
    
    -- ����03 ��ġ�� ������!
    {
        ID      = "ATTACK03",
        Motion  = "Sabertooth_Attack03.frm",
        Func    = "Carnival_Lyonnesse_Attack03Func",
    },
    
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Sabertooth_Jump_Down.frm",
        Func    = "Carnival_Lyonnesse_JumpFunc",
    },

    -- ��������
    {
        ID      = "HIGHJUMP",
        Motion  = "Sabertooth_Jump.frm",
        Func    = "Carnival_Lyonnesse_HighJumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Sabertooth_Damage_Up.frm",
        Func    = "Carnival_Lyonnesse_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Sabertooth_Damage_Middle.frm",
        Func    = "Carnival_Lyonnesse_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Sabertooth_Damage_Down.frm",
        Func    = "Carnival_Lyonnesse_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID      = "DOWN_UP01",
        Motion  = "Sabertooth_Down_Up01.frm",
        Func    = "Carnival_Lyonnesse_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "Carnival_Lyonnesse_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID      = "DOWN_UP02",
        Motion  = "Sabertooth_Down_Up02.frm",
        Func    = "Carnival_Lyonnesse_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
	
	-- �ٿ� �� ����
    {
        ID      = "DOWN_UP_LANDING",
        Motion  = "Sabertooth_Down_Up03.frm",
        Func    = "Carnival_Lyonnesse_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_Lyonnesse_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_MIDDLE",
        Motion  = "Sabertooth_Down_Middle.frm",
        Func    = "Carnival_Lyonnesse_DownFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_Lyonnesse_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID      = "DOWN_DOWN",
        Motion  = "Sabertooth_Down_Down.frm",
        Func    = "Carnival_Lyonnesse_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_Lyonnesse_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID      = "DOWN_SPECIAL",
        Motion  = "Sabertooth_SpecialDown_01.frm",
        Func    = "Carnival_Lyonnesse_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID      = "DOWN_SPECIAL_LANDING",
        Motion  = "Sabertooth_SpecialDown_02.frm",
        Func    = "Carnival_Lyonnesse_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Carnival_Lyonnesse_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "Sabertooth_Down_Middle.frm",
        Func    = "Carnival_Lyonnesse_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Sabertooth_StandUp.frm",
        Func    = "Carnival_Lyonnesse_StandupFunc",
    },
    
    -- ������
    {
        ID      = "STANDUPATK",
        Motion  = "Sabertooth_StandUpAttack.frm",
        Func    = "Carnival_Lyonnesse_StandupAtkFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Sabertooth_Stone.frm",
        Func    = "Carnival_Lyonnesse_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Sabertooth_Stone.frm",
        Func    = "Carnival_Lyonnesse_IceCurseFunc",
    },
    
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Sabertooth_Stone.frm",
		Func	= "Carnival_Lyonnesse_HoldFunc",
	},
	
	-- ��ȯ
    {
        ID      = "SUMMON",
        Motion  = "Sabertooth_Wait.frm",
        Func    = "Carnival_Lyonnesse_SummonFunc",
	},
}

CallBack =
{
    Land    = "OnCarnival_Lyonnesse_Land",
    Die     = "OnCarnival_Lyonnesse_Die",
    Damage  = "OnCarnival_Lyonnesse_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitCarnival_Lyonnesse( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction( ATTACKTYPE_HOLD,  ATTACKDIR_NORMAL,  "HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
	
	if( 10 == pMonster:GetLevel() ) then
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_LYONNESSE_DEF, 100000.0, 1, -1, false, false );
	elseif( 20 == pMonster:GetLevel() ) then
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_LYONNESSE_DEF, 100000.0, 2, -1, false, false );
	else
		pMonster:SetMagicEffect( iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_LYONNESSE_DEF, 100000.0, 3, -1, false, false );
	end
	pMonster:SetCountValue(0)
	
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
function Carnival_Lyonnesse_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		if( pMonster:IsMagicEffect(iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_LYONNESSE_DEF) and
			false == pMonster:CheckLiveMonster(MON_CARNIVAL_ORTINA) ) then
			pMonster:ClearMagicEffect(iMonsterIndex, EGC_EFFECT_EVENT_CARNIVAL_LYONNESSE_DEF)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ������ ����
function Carnival_Lyonnesse_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "IDLE" )
    end
    
end

-- �޸��� ����
function Carnival_Lyonnesse_RunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame == 23 ) then
		pMonster:PlaySound(999024)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end

end

-- �״»���
function Carnival_Lyonnesse_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(999066)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- �״»��� ����
function Carnival_Lyonnesse_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Carnival_Lyonnesse_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function Carnival_Lyonnesse_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then		
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function Carnival_Lyonnesse_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ�
function Carnival_Lyonnesse_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )				
		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end		
    end
end

-- �ٿ� �ٿ�
function Carnival_Lyonnesse_DownDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 3 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 7 ) then
		pMonster:SetNoCheckContact( 15 )
		pMonster:SetSpeedX( pMonster:GetSpeedX() / 5 )		
		pMonster:SetSpeedY( 0.03 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
			pMonster:SetState( "DOWN_UP01" )
    end
end

-- �ٿ� �����
function Carnival_Lyonnesse_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function Carnival_Lyonnesse_DownSpecialLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetPushCheck( false )
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )		
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end        		
    end
end

-- �Ͼ��
function Carnival_Lyonnesse_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 21 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- ������
function Carnival_Lyonnesse_StandupAtkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 24 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.0 )
		pMonster:StartAttack( 3,PAR_BIG_DAMAGE,0.34, 18, 18, 6)
	elseif( iFrame == 32 ) then
		pMonster:StartAttack( 3,PAR_BIG_DAMAGE,0.34, 18, 18, 6)
	elseif( iFrame == 43 ) then
		pMonster:StartAttack( 3,PAR_BIG_DAMAGE,0.34, 18, 18, 6)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

--  �������� ����
function Carnival_Lyonnesse_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 35 ) then
		pMonster:PlaySound(999025)
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 51 ) then
		pMonster:AddParticle( "Circus_Lioness_Scratch", 0.5, 0.15 )
		pMonster:StartAttack( 6,PAR_BIG_DAMAGE,0.1, 18, 18, 4)
	elseif( iFrame == 77 ) then
		pMonster:AddParticle( "Circus_Lioness_Scratch", 0.5, 0.15 )
		pMonster:StartAttack( 6,PAR_DOWN,0.1, 18, 18, 5)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ��ġ������ ����
function Carnival_Lyonnesse_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 47 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection( "Circus_Lioness_Shouting_02", 0.38, 0.13 )
		else
			pMonster:AddParticleNoDirection( "Circus_Lioness_Shouting_02_R", -0.38, 0.13 )
		end
		pMonster:AddParticle( "Circus_Lioness_Shouting_01", 0.38, 0.1 )
		
		pMonster:AddDamage(DT_MON_LYONNESSE_ATTACK02)
		pMonster:PlaySound(999026)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
    
end


--  ������
function Carnival_Lyonnesse_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
    pMonster:SetSuperArmor( true )
	
    elseif( iFrame == 30 ) then
		pMonster:StartAttack( 6,PAR_BIG_DAMAGE, 0.2, 18, 18, 9)
	elseif( iFrame == 65 ) then
		pMonster:StartAttack( 3,PAR_BIG_DAMAGE, 0.2, 8, 8, 4)
		pMonster:PlaySound(999027)
	elseif( iFrame == 87 ) then
		pMonster:StartAttack( 3,PAR_SMALL_DAMAGE, 0.2, 8, 8, 4)
	elseif( iFrame == 92 ) then
		pMonster:PlaySound(999027)
	elseif( iFrame == 109 ) then
		pMonster:StartAttack( 5,PAR_DOWN, 0.2, 8, 8, 4)
	elseif( iFrame == 112 ) then
		pMonster:PlaySound(999027)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ���� ����
function Carnival_Lyonnesse_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end

end

--  �������� ����
function Carnival_Lyonnesse_HighJumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP")
		pMonster:SetFrameLock( false )
		pMonster:SetSuperArmor( true )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ����Ŀ�� �ɷ���
function Carnival_Lyonnesse_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Carnival_Lyonnesse_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function Carnival_Lyonnesse_HoldFunc( iMonsterIndex, iFrame )
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

function Carnival_Lyonnesse_SummonFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( iFrame == 1 ) then
		pMonster:AddParticleNoDirection( "Setesh_Summon_01", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Setesh_Summon_02", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Setesh_Summon_03", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Setesh_Summon_04", 0.0, 0.0 )
		pMonster:AddParticleNoDirection( "Setesh_Summon_05", 0.0, 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function Carnival_Lyonnesse_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1000, 1000, 1000, -1000 ) == true or pMonster:SetTarget( 0, -200, 800, 200, -800 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
		
        pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 500, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
        pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Carnival_Lyonnesse_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.7 ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_Check_WalkStop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, 100, 100, -100 ) == true ) then
    	pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )		
		pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Carnival_Lyonnesse_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 80, -150, 100, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 80, 150, -150 ) == true ) then
		pMonster:SetCountValue(0)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 350, -100, 80, 100, -150 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_Check_HighJump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 150, -150, 300, 150, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Carnival_Lyonnesse_Jump( iMonsterIndex )
		pMonster:SetState( "HIGHJUMP" )
		pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 100, -100, -40, 100, -300 ) == true ) then
		pMonster:SetNoCheckContact(15)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
    end
end

function Carnival_Lyonnesse_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		if( pMonster:CheckTargetInRange( 200, -200, 150, 200, -100 ) == true ) then
			if ( pMonster:FloatRand() < 0.2) then
				pMonster:SetState( "STANDUPATK" )
			else
				pMonster:SetState( "STANDUP" )
			end			
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end

-- ������.. 
function Carnival_Lyonnesse_Check_Idle( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
		pMonster:SetState( "IDLE" )
        pMonster:ResetDelay()
    end
end

-- ������ ��.. ���߱�
function Carnival_Lyonnesse_Check_Idle_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == false ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnCarnival_Lyonnesse_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 4.0) )

    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
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

function OnCarnival_Lyonnesse_Die( iMonsterIndex )
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

function OnCarnival_Lyonnesse_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)
	pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
	
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
	
	--[[ �뷱�� �۾� -> �ݰ� ����
	if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false ) then	
		if ( pMonster:FloatRand() < 0.7 ) then
			pMonster:SetState( "ATTACK01" )
		else
			pMonster:SetState( "ATTACK03" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end
	--]]
end

function Carnival_Lyonnesse_Jump( iMonsterIndex )
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

function Carnival_Lyonnesse_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.036 )			
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.018 )		
		end
	end
end

function Carnival_Lyonnesse_IdleMoveFail( iMonsterIndex )
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