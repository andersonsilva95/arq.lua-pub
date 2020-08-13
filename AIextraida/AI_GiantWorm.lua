-- AI_GiantWorm.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "DrakeWorm_Wait.frm",
        Func    = "GiantWorm_WaitFunc",


		-- �������ϵ��� ����ɼ� �ִ� Ʈ���ŵ��� �����Ѵ�.
		
        Trigger =
        {

            -- Ÿ����
            {
                AICheckFrame        = 50,                            -- �󸶳� ���� ������ Ʈ���Ÿ� üũ�� �������� ��ġ�� �Է�(������)
                AIFunc              = "GiantWorm_Check_Targeting",      -- Ʈ���Ű� üũ�Ǿ����� ����� ������ �Լ��� �̸��� �Է�(���������� �Է��ϴ� �Լ�)
                DelayFrame          = 150,                           -- ����� ����Ǿ����� Ʈ���� üũ�� �󸶵��� ���� �������� ��ġ�� �Է�
            },
            -- Ÿ������
            {
                AICheckFrame        = 200,
                AIFunc              = "GiantWorm_Check_ReleaseTarget",
                DelayFrame          = 300,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "GiantWorm_Check_TurnToTarget",
                DelayFrame          = 20,
            },
--[[
            -- �ȱ�
            {
                AICheckFrame        = 75,
                AIFunc              = "GiantWorm_Check_Walk",
                DelayFrame          = 110,
            },
            -- �޸���
            --{
            --    AICheckFrame        = 75,
            --    AIFunc              = "GiantWorm_Check_Run",
            --    DelayFrame          = 110,
            --},

            -- �����̵�
            {
                AICheckFrame        = 200,
                AIFunc              = "GiantWorm_Check_JumpMove",
                DelayFrame          = 100,
            },

            -- ������
            {
                AICheckFrame        = 40,
                AIFunc              = "GiantWorm_Check_JumpUp",
                DelayFrame          = 80,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantWorm_Check_JumpDown",
                DelayFrame          = 110,
            },
			-- �ʻ�� // ��� �̰�?
            --{
            --    AICheckFrame        = --45,
            --    AIFunc              = "GiantWorm_Check_SpecialAttack",
            --    DelayFrame          = --550,
            --},
--]]
            -- ��������
            {
                AICheckFrame        = 1,--120,
				AICheckFrame1       = 70,
				AICheckFrame2       = 30,
				AICheckFrame3       = 30,
                AIFunc              = "GiantWorm_Check_Attack01",
                DelayFrame          = 1,--200,
            },
--[[
            -- ���׹��
            {
                AICheckFrame        = 100,
                AIFunc              = "GiantWorm_Check_Attack02",
                DelayFrame          = 200,
            },

            -- ����
            {
                AICheckFrame        = 160,
				AICheckFrame1       = 120,
				AICheckFrame2       = 80,
				AICheckFrame3       = 80,
                AIFunc              = "GiantWorm_Check_Attack03",
                DelayFrame          = 100,
            },
            -- �Ѹ� ����
            {
                AICheckFrame        = 230,
				AICheckFrame1       = 190,
				AICheckFrame2       = 150,
				AICheckFrame3       = 150,
                AIFunc              = "GiantWorm_Check_Attack04",
                DelayFrame          = 100,
            },
--]]
        },
    },
--[[
	-- WAIT TO RUN
    {
        ID      = "WALK_READY",
        Motion  = "DrakeWorm_Wait_Move.frm",
        Func    = "GiantWorm_WalkReadyFunc",
    },
    
    -- RUN TO WAIT
    {
        ID      = "WALK_END",
        Motion  = "DrakeWorm_Move_Wait.frm",
        Func    = "GiantWorm_WalkEndFunc",
    },
--]]
    -- �̵�
    {
        ID              = "WALK",
        Motion          = "DrakeWorm_Move.frm",
        Func            = "GiantWorm_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "GiantWorm_MoveFail",


        Trigger =
        {
            -- Ÿ����
            {
                AICheckFrame        = 55,
                AIFunc              = "GiantWorm_Check_Targeting",
                DelayFrame          = 110,
            },
            -- Ÿ������
            {
                AICheckFrame        = 220,
                AIFunc              = "GiantWorm_Check_ReleaseTarget",
                DelayFrame          = 440,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 30,
                AIFunc              = "GiantWorm_Check_TurnToTarget",
                DelayFrame          = 55,
            },
            -- ������
            {
                AICheckFrame        = 40,
                AIFunc              = "GiantWorm_Check_JumpUp",
                DelayFrame          = 50,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 50,
                AIFunc              = "GiantWorm_Check_JumpDown",
                DelayFrame          = 60,
            },
            -- ��������
            {
                AICheckFrame        = 120,
				AICheckFrame1       = 70,
				AICheckFrame2       = 30,
				AICheckFrame3       = 30,
                AIFunc              = "GiantWorm_Check_Attack01",
                DelayFrame          = 200,
            },
            -- ����
            {
                AICheckFrame        = 160,
				AICheckFrame1       = 120,
				AICheckFrame2       = 80,
				AICheckFrame3       = 80,
                AIFunc              = "GiantWorm_Check_Attack03",
                DelayFrame          = 100,
            },
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "GiantWorm_Check_Stop",
                DelayFrame          = 60,
            },
        }
    },

    -- ��������01
    {
        ID      = "ATTACK01",
        Motion  = "GiantWorm_Attack01.frm",
        Func    = "GiantWorm_Attack01Func",
    },
    -- ��������01
    {
        ID      = "ATTACK02",
        Motion  = "GiantWorm_Attack02.frm",
        Func    = "GiantWorm_Attack02Func",
    },
    -- ��������01
    {
        ID      = "ATTACK03",
        Motion  = "GiantWorm_Attack03.frm",
        Func    = "GiantWorm_Attack03Func",
    },
    -- ��������01
    {
        ID      = "ATTACK04",
        Motion  = "GiantWorm_Attack04.frm",
        Func    = "GiantWorm_Attack04Func",
    },
	
    -- ����
    {
        ID      = "JUMP",
        Motion  = "GiantWorm_Jump.frm",
        Func    = "GiantWorm_JumpFunc",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "GiantWorm_Damage_Up.frm",
        Func    = "GiantWorm_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "DrakeWorm_Damage_Middle.frm",
        Func    = "GiantWorm_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "DrakeWorm_Damage_Down.frm",
        Func    = "GiantWorm_DamageFunc",
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_UP01",
        Motion              = "GiantWorm_Down_Up01.frm",
        Func                = "GiantWorm_DownUpFunc",
        
        Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "GiantWorm_CheckDownUp02",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��02
    {
        ID                  = "DOWN_UP02",
        Motion              = "GiantWorm_Down_Up02.frm",
        Func                = "GiantWorm_DownUp02Func",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� �� ����
    {
        ID                  = "DOWN_UP_LANDING",
        Motion              = "GiantWorm_Down_Up03.frm",
        Func                = "GiantWorm_DownUp03Func",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantWorm_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� ��
    {
        ID                  = "DOWN_MIDDLE",
        Motion              = "GiantWorm_Down_Middle.frm",
        Func                = "GiantWorm_DownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantWorm_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },

    -- �ٿ� ��
    {
        ID                  = "DOWN_DOWN",
        Motion              = "GiantWorm_Down_Down.frm",
        Func                = "GiantWorm_DownDownFunc",
        IsFallDownMotion    = TRUE,

        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantWorm_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ٿ� �����
    {
        ID                  = "DOWN_SPECIAL",
        Motion              = "GiantWorm_Down_Special01.frm",
        Func                = "GiantWorm_DownSpecialFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ٿ� ����� ����
    {
        ID                  = "DOWN_SPECIAL_LANDING",
        Motion              = "GiantWorm_Down_Special02.frm",
        Func                = "GiantWorm_DownSpecialLandingFunc",
        IsFallDownMotion    = TRUE,
        
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "GiantWorm_CheckStandup",
                DelayFrame          = 0,
            },
        }
    },
    
    -- �ױ�
    {
        ID                  = "DIE_LANDING",
        Motion              = "DrakeWorm_Die.frm",
        Func                = "GiantWorm_DieFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID                  = "DIE_LANDING",
        Motion              = "DrakeWorm_Die.frm",
        Func                = "GiantWorm_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- ��
	{
		ID	  = "TURN",
		Motion  = "DrakeWorm_Turn.frm",
		Func	= "GiantWorm_TurnFunc",
	},

    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "GiantWorm_Standup.frm",
        Func    = "GiantWorm_StandupFunc",
    },
    
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "GiantWorm_Stone.frm",
        Func    = "GiantWorm_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "GiantWorm_Stone.frm",
        Func    = "GiantWorm_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "GiantWorm_Stone.frm",
		Func	= "GiantWorm_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnGiantWorm_Land",
    Die     = "OnGiantWorm_Die",
    Damage  = "OnGiantWorm_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitGiantWorm( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,           "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE,       "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,         "DAMAGE_DOWN" )
 
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,             "DOWN_UP01" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,         "DOWN_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,           "DOWN_DOWN" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,         "DOWN_SPECIAL" )

    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    pMonster:SetPushCheck(true)
    pMonster:SetFly(false)
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function GiantWorm_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 1 ) then
		pMonster:SetSpeedX( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- �ȱ� ���� ����
function GiantWorm_WalkReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �ȱ� �� ����
function GiantWorm_WalkEndFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function GiantWorm_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

	if( iFrame == 15 ) then
    	pMonster:PlaySound(998001)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:PlaySound(998001)
        pMonster:SetState( "WALK" )
    end
end

-- �״»��� ����
function GiantWorm_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function GiantWorm_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ٿ� ��
function GiantWorm_DownUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��2
function GiantWorm_DownUp02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �ٿ� ��3
function GiantWorm_DownUp03Func( iMonsterIndex, iFrame )
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
function GiantWorm_DownFunc( iMonsterIndex, iFrame )
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

-- �ٿ� �ٿ�
function GiantWorm_DownDownFunc( iMonsterIndex, iFrame )
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
function GiantWorm_DownSpecialFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( false )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DOWN_SPECIAL" )
    end
end

-- �ٿ� ����� ����
function GiantWorm_DownSpecialLandingFunc( iMonsterIndex, iFrame )
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

-- ��
function GiantWorm_TurnFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetIsRight( not pMonster:GetIsRight() )
		pMonster:SetState( "WAIT" )
    end
end

-- �Ͼ��
function GiantWorm_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
        pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function GiantWorm_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 44 ) then
    	pMonster:PlaySound(998039)
    elseif( iFrame == 47 ) then
		pMonster:StartAttack( 3, PAR_SMALL_DAMAGE, 0.2, 23, 23, 7)
	elseif( iFrame == 68 ) then
    	pMonster:PlaySound(998039)
	elseif( iFrame == 73 ) then
		pMonster:StartAttack( 4, PAR_DOWN, 0.2, 23, 23, 7)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���׹��
function GiantWorm_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 58 ) then
		pMonster:PlaySound(998040)
	elseif( iFrame == 61 ) then
		pMonster:AddDamage(DT_GIANTWORM_POISON)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����
function GiantWorm_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 45 and iFrame <= 80 ) then
		if( math.mod(iFrame, 7) == 0 ) then
			for i = 0, 5 do
				pMonster:StartAttack( 1.5, PAR_SMALL_DAMAGE, 0.2, 25-(i*2), 25-(i*2), 5)
			end
		elseif( math.mod(iFrame, 7) == 6 ) then
			pMonster:EndAttack()
		end
    end
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 40 ) then
		pMonster:PlaySound(998041)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �Ѹ�����
function GiantWorm_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= 20 and iFrame <= 75 ) then
		if( math.mod(iFrame, 7) == 0 ) then
			for i = 0, 3 do
				pMonster:StartAttack( 2, PAR_SMALL_DAMAGE, 0.2, 25-(i*2), 25-(i*2), 5)
			end
		elseif( math.mod(iFrame, 7) == 6 ) then
			pMonster:EndAttack()
		end
    end
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 20 ) then
		pMonster:PlaySound(998042)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  ���� ����
function GiantWorm_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ����Ŀ�� �ɷ���
function GiantWorm_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_LANDING" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function GiantWorm_IceCurseFunc( iMonsterIndex, iFrame )
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
function GiantWorm_HoldFunc( iMonsterIndex, iFrame )
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

function GiantWorm_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -400, 200, 400, -100 ) == true or pMonster:SetTarget( 0, -200, 400, 200, -200 ) == true ) then
		local fTargetX = pMonster:GetTargetX()
		local fX = pMonster:GetX()

		if( pMonster:IsTarget() == true and ( ( pMonster:GetIsRight() and (fX - fTargetX) > 0.0 ) or ( pMonster:GetIsRight() == false and (fX - fTargetX) < 0.0 ) ) ) then
			pMonster:SetState( "TURN" )
		end

        pMonster:ResetDelay()
    end
end

function GiantWorm_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 300, -600, 600, 600, -500 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	local fTargetX = pMonster:GetTargetX()
    local fX = pMonster:GetX()

	if( pMonster:IsTarget() == true and ( ( pMonster:GetIsRight() and (fX - fTargetX) > 0.0 ) or ( pMonster:GetIsRight() == false and (fX - fTargetX) < 0.0 ) ) ) then
        pMonster:SetState( "TURN" )
        pMonster:ResetDelay()
    end
end

function GiantWorm_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 600, -500, 500, 500, -500 ) == true and pMonster:CheckTargetInRange( 0, -100, 100, 100, -150 ) == false and pMonster:FloatRand() < 0.7 ) then
		pMonster:TurnToTarget()
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 240, 160, -320 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
        pMonster:SetState( "DOWN_UP02" )
    end
end

function GiantWorm_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -120, 80, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 320, -160, 80, 160, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 340, -180, 80, 180, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -150, 80, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_JumpMove( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 500, -100, 80, 100, -100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetNoCheckContact(50)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 3.5 )
		pMonster:SetSpeedY( 0.04 )			
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_JumpAttack( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 110, -110, 300, 110, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		GiantWorm_Jump( iMonsterIndex )
		pMonster:SetState( "JUMPATTACK" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -180, 300, 180, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		GiantWorm_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function GiantWorm_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 160, -150, -80, 150, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )			
		pMonster:ResetDelay()
	end
end

function GiantWorm_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnGiantWorm_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (1.0 / 2.0) )
    local fTargetX = pMonster:GetTargetX()
    local fX = pMonster:GetX()

    if( pMonster:CheckState( "JUMP" ) == true ) then
        if( pMonster:IsTarget() == true and ( ( pMonster:GetIsRight() and (fX - fTargetX) > 0.0 ) or ( pMonster:GetIsRight() == false and (fX - fTargetX) < 0.0 ) ) ) then
			pMonster:SetState( "TURN" )
		else
			pMonster:SetState( "WAIT" )
		end
    elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_SPECIAL_LANDING" )
    end
    
    if ( pMonster:FloatRand() < 0.06 and pMonster:IsSuperArmor() == false ) then	
		pMonster:SetState( "ATTACK01" )
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor(true)
	end	

	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE_LANDING" )
	end
end

function OnGiantWorm_Die( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:TurnToTarget()

    if( pMonster:GetIsRight() == true ) then
        pMonster:SetSpeedX( -0.02 )
    else
        pMonster:SetSpeedX( 0.02 )
    end

    pMonster:SetState( "DIE_LANDING" )
end

function OnGiantWorm_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	pMonster:AddCountValue(1)
	pMonster:SetSpeedY( 0.0 )
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMPATTACK" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
	
	if( pMonster:CheckState( "DOWN_MIDDLE" ) == true or pMonster:CheckState( "DOWN_DOWN" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )		
	end

	if( pMonster:CheckPreState( "DOWN_UP01" ) == true or pMonster:CheckPreState( "DOWN_UP02") == true ) then
		
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
			
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_MIDDLE" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 80) )			
		end	
	end
	
	if( pMonster:IsSuperArmor() == false and pMonster:FloatRand() < 0.05 ) then
		if( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK03" )
		else
			pMonster:SetState( "ATTACK01" )
		end
		pMonster:TurnToTarget()
		pMonster:SetSuperArmor( true )
    end
end

function GiantWorm_Jump( iMonsterIndex )
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

function GiantWorm_MoveFail( iMonsterIndex )
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
