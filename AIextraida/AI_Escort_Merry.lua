-- AI_Summon_Merry.lua

local MotherMoving = 0
local CheckTeleport = 0
local PeaceTime = 0
local GodTime = 0

ActionList =
{
    -- ����
    {
        ID      = "INIT",
        Motion  = "Mery_Jump_up.frm",
        Func    = "Summon_Merry_InitFunc",
    },
--[[
    -- ��ų���
    {
        ID      = "USE_SKILL",
        Motion  = "Mery_Wait.frm",
        Func    = "Summon_Merry_UseSkillFunc",
    },

    -- ����
    {
        ID      = "JOCK",
        Motion  = "Mery_Joke.frm",
        Func    = "Summon_Merry_JockFunc",
    },
--]]
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Mery_Wait.frm",
        Func    = "Summon_Merry_WaitFunc",

        Trigger =
        {
		--[[
			-- Ÿ����
            {
                AICheckFrame        = 10,
                AIFunc              = "Summon_Merry_Check_Targeting",
                DelayFrame          = 0,
            },
            -- Ÿ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Merry_Check_ReleaseTarget",
                DelayFrame          = 216,
            },
            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 11,
                AIFunc              = "Summon_Merry_Check_TurnToTarget",
                DelayFrame          = 0,
            },
			--]]
			--[[
            -- �⺻����
            {
                AICheckFrame        = 5,
                AIFunc              = "Summon_Merry_Check_Attack01",
                DelayFrame          = 0,
            },
			--]]
			-- ���ιٲٱ�
            --[[
			{
                AICheckFrame        = 3,
                AIFunc              = "Summon_Merry_Check_Change_Master",
                DelayFrame          = 55,
            }, 
			--]]			
            -- �ȱ�
            {
                AICheckFrame        = 14,
                AIFunc              = "Summon_Merry_Check_Walk",
                DelayFrame          = 220,
            },
            -- �������� �Ÿ��˻�
            {
                AICheckFrame        = 5,
                AIFunc              = "Summon_Merry_Check_Mother",
                DelayFrame          = 55,
            },
		}
	},
    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Mery_Walk.frm",
        Func            = "Summon_Merry_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Summon_Merry_MoveFail",

        Trigger =
        {
		--[[
			-- Ÿ����
			{
                AICheckFrame        = 10,
                AIFunc              = "Summon_Merry_Check_Targeting",
                DelayFrame          = 0,
            },
            -- Ÿ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Merry_Check_ReleaseTarget",
                DelayFrame          = 101,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 11,
                AIFunc              = "Summon_Merry_Check_TurnToTarget",
                DelayFrame          = 0,
            },      
		--]]
		-- �÷����Ӹ����� Ȯ���ϰ� �´ٸ� �������� �ʴ´�.
			{
				AICheckFrame        = 1,
                AIFunc              = "Summon_Merry_Check_Platformer",
                DelayFrame          = 0,				
			},
            -- ������
            {
                AICheckFrame        = 12,
                AIFunc              = "Summon_Merry_Check_JumpUp",
                DelayFrame          = 220,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 13,
                AIFunc              = "Summon_Merry_Check_JumpDown",
                DelayFrame          = 220,
            },
			-- ���߱�
            {
                AICheckFrame        = 9,
                AIFunc              = "Summon_Merry_Check_Stop",
                DelayFrame          = 550,
            },
        }
    },
    -- �������Է� �̵�
    {
        ID      = "MOVE_MOTHER",
        Motion  = "Mery_Wait.frm",
        Func    = "Summon_Merry_MoveMotherFunc",

        Trigger =
        {
            -- �ȱ�
            {
                AICheckFrame        = 10,
                AIFunc              = "Summon_Merry_Check_MoveMother_Walk",
                DelayFrame          = 55,
            },
            -- ������
            {
                AICheckFrame        = 20,
                AIFunc              = "Summon_Merry_Check_MoveMother_JumpUp",
                DelayFrame          = 220,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 21,
                AIFunc              = "Summon_Merry_Check_MoveMother_JumpDown",
                DelayFrame          = 220,
            },
            -- �̵����� �˻�
            {
                AICheckFrame        = 5,
                AIFunc              = "Summon_Merry_Check_MoveMother_Stop",
                DelayFrame          = 550,
            },
            -- �ڷ���Ʈ �˻�
            {
                AICheckFrame        = 9,
                AIFunc              = "Summon_Merry_Check_MoveMother_Teleport",
                DelayFrame          = 330,
            },
        }
    },
    -- �������Է� �ȱ�
    {
        ID              = "MOTHER_WALK",
        Motion          = "Mery_Walk.frm",
        Func            = "Summon_Merry_Mother_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Summon_Merry_Mother_MoveFail",

        Trigger =
        {
		-- �÷����Ӹ����� Ȯ���ϰ� �´ٸ� �������� �ʴ´�.
			{
				AICheckFrame        = 1,
                AIFunc              = "Summon_Merry_Check_Platformer",
                DelayFrame          = 0,				
			},
			-- ���߱�
            {
                AICheckFrame        = 10,
                AIFunc              = "Summon_Merry_Check_MoveMother_Stop",
                DelayFrame          = 0,
            },
        }        
    },
    -- �������Է� �ڷ���Ʈ
    {
        ID              = "MOTHER_TELEPORT",
        Motion          = "Mery_Teleport.frm",
        Func            = "Summon_Merry_Mother_TeleportFunc",
    },
	-- �޸� ����
    {
        ID              = "RUNAWAY",
        Motion          = "Mery_Walk.frm",
        Func            = "Summon_Merry_RunawayFunc",
		EnableMoveCheck = TRUE,
        MoveFailFunc    = "Summon_Merry_Mother_MoveFail",
		
		 Trigger =
        {
			-- ������
            {
                AICheckFrame        = 110,
                AIFunc              = "Summon_Merry_Check_JumpUp",
                DelayFrame          = 110,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 110,
                AIFunc              = "Summon_Merry_Check_JumpDown",
                DelayFrame          = 110,
            },
        }  
    },
	--[[
    -- �⺻����
    {
        ID      = "ATTACK01",
        Motion  = "Mery_Attack.frm",
        Func    = "Summon_Merry_Attack01Func",
    },
	--]]
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Mery_Jump_up.frm",
        Func    = "Summon_Merry_JumpFunc",
    },
    -- �ٿ�����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Mery_Jump_down.frm",
        Func    = "Summon_Merry_JumpDownFunc",
    },
    -- ��������
    {
        ID      = "JUMP_LANDING",
        Motion  = "Mery_Jump_landing.frm",
        Func    = "Summon_Merry_ToWait",
    },
    -- ������
    {
        ID      = "DAMAGE",
        Motion  = "Mery_Damage.frm",
        Func    = "Summon_Merry_DamageFunc",
    },
    -- �ױ�1
    {
        ID      = "DIE01",
        Motion  = "Mery_Die.frm",
        Func    = "Summon_Merry_Die1Func",
        IsFallDownMotion    = TRUE,
    },   
    -- �ױ�2
    {
        ID      = "DIE02",
        Motion  = "Mery_Die2.frm",
        Func    = "Summon_Merry_Die2Func",
        IsFallDownMotion    = TRUE,
    },       
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Mery_Stone.frm",
        Func    = "Summon_Merry_StoneCurseFunc",
    },
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Mery_Stone.frm",
        Func    = "Summon_Merry_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Mery_Stone.frm",
		Func	= "Summon_Merry_HoldFunc",
	},
	--[[
    -- ����
	{
		ID		= "JOKE",
		Motion	= "Mery_Joke.frm",
		Func	= "Summon_Merry_JokeFunc",
	},	
	--]]
}

CallBack =
{
    Land    = "OnSummon_Merry_Land",
    Die     = "OnSummon_Merry_Die",
    Damage  = "OnSummon_Merry_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitMerry( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_NORMAL, "DAMAGE" )

    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )

    --pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    --pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,     "ICECURSE" )
    --pMonster:RegistReaction( ATTACKTYPE_HOLD, ATTACKDIR_NORMAL,         "HOLD" )

    pMonster:SetCountValue( pMonster:GetHP() - 700 )
    pMonster:SetState( "INIT" )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ���� ����
function Summon_Merry_InitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= (pMonster:GetLastFrame() - 1) ) then
        --pMonster:SetY( pMonster:GetY() + 0.3 )
        pMonster:SetState( "WAIT" )
    end
end

-- ��� ����
function Summon_Merry_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	-- ���� ������ �����̸�
	if( pMonster:IsHost() == true ) then
		Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
	end

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Summon_Merry_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

	if( Player and Player:CheckSkill( SID_LEY02_BASTION_SPEED_LV1 ) ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 1.5 )
	elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPEED_LV2 ) ) then
		pMonster:SetSpeedX( pMonster:GetRunSpeed() * 2 ) 
	else
		pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	end
	
	-- ���� ������ �����̸�
	if( pMonster:IsHost() == true ) then
		Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
	end

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetState( "WAIT" )
	end
end

-- �׾���1
function Summon_Merry_Die1Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )		
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end
-- �׾���2
function Summon_Merry_Die2Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )		
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Summon_Merry_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( iFrame == 1) then
	--	if( pMonster:GetIsRight() ) then
    --        pMonster:SetSpeedX( -0.02 )
	--	else
    --        pMonster:SetSpeedX( 0.02 )
	--	end
	--end
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "RUNAWAY" )
    end
end

--  ���� ����
function Summon_Merry_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
    else
        -- ���� ������ �����̸�
		if( pMonster:IsHost() == true ) then
			Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
		end
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �ٿ� ����
function Summon_Merry_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    -- ���� ������ �����̸�
	if( pMonster:IsHost() == true ) then
		Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- �������Է� �̵�
function Summon_Merry_MoveMotherFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    -- ���� ������ �����̸�
	if( pMonster:IsHost() == true ) then
		Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
	end

    if( iFrame >= pMonster:GetLastFrame() and pMonster:IsPlatformer() == false ) then
        pMonster:SetState( "MOVE_MOTHER" )
    end
end

--  ���� ����
function Summon_Merry_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    -- ���� ������ �����̸�
	if( pMonster:IsHost() == true ) then
		Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
	end
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Summon_Merry_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE01" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Summon_Merry_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE01" )
		end
    end
end

-- Ȧ�� �ɷ���(����Ʈ)
function Summon_Merry_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE01" )
		end
	end
end

--[[
-- ����
function Summon_Merry_JokeFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end
--]]

-- �������Է� �ȱ� ����
function Summon_Merry_Mother_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
	
    -- ���� ������ �����̸�
	if( pMonster:IsHost() == true ) then
		Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
	end
	

    if( iFrame >= pMonster:GetLastFrame() and pMonster:IsPlatformer() == false) then
        pMonster:SetState( "MOTHER_WALK" )
    end
end

-- �������Է� �ڷ���Ʈ
function Summon_Merry_Mother_TeleportFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetFrameLock( false )

    if( iFrame <= 2 ) then

        if( 0 == CheckTeleport ) then
            pMonster:AddParticleNoDirection( "Ley_BlackHole_After_03", 0, 0 )
            pMonster:AddParticleNoDirection( "Ley_Summon_Jeeves_02", 0, 0 )
            pMonster:AddParticleNoDirection( "Rey_Shot_After", 0, 0 )
            pMonster:AddParticleNoDirection( "Rey_Tel_in_02", 0, 0 )
			pMonster:AddParticleNoDirection( "Merry_Tel_out", 0, 0 )
        else
            local MotherPos = pMonster:GetPlayerPosByMinDistance()
            pMonster:SetX( MotherPos.x )
            pMonster:SetY( MotherPos.y )
            pMonster:SetSpeedX( 0.0 )
            pMonster:SetSpeedY( 0.0 )
        end

        CheckTeleport = 1

    elseif( iFrame >= pMonster:GetLastFrame() ) then

        if( 1 == CheckTeleport ) then
            pMonster:AddParticleNoDirection( "Ley_BlackHole_After_03", 0, 0 )
            pMonster:AddParticleNoDirection( "Ley_Summon_Jeeves_02", 0, 0 )
            pMonster:AddParticleNoDirection( "Rey_Shot_After", 0, 0 )
            pMonster:AddParticleNoDirection( "Rey_Tel_in_02", 0, 0 )
			pMonster:AddParticleNoDirection( "Merry_Tel_out", 0, 0 )
        end

        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
        CheckTeleport = 2
    end
end

-- �޸� ����
function Summon_Merry_RunawayFunc( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:GetDamageDirection() == 1 ) then
		pMonster:SetIsRight( false )
	else
		pMonster:SetIsRight( true )
	end
	
	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )	
end

--[[
-- �⺻����
function Summon_Merry_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -100, 50, 100, -50 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end
--]]
-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------
--[[
-- ��ų���
function Summon_Merry_UseSkillFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

    if( iFrame > 5 ) then
        -- �θ� ���¹���� ���� ������ֵ��� ����!
        pMonster:SameTurnToMother();
                
        -- ���ɵ��
        if( 1 == pMonster.m_iRecvStateFromPlayer ) then
			pMonster:PlaySound( 1200103 )
			local v
			v = Player:GetTargetPos(1, 0.9)
			
			if( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDROP_LV1 ) ) then
				if ( Player:GetIsRight() ) then
					if(v.x == 0 and v.y == 0 ) then
						Player:AddDamage( DT_SUMMON_MERRY_SPINDROP_LV1_R )
					else
						Player:AddDamageTarget( DT_SUMMON_MERRY_SPINDROP_FIND_LV1_R, v )
					end
				else
					if(v.x == 0 and v.y == 0 ) then
						Player:AddDamage( DT_SUMMON_MERRY_SPINDROP_LV1_L )
					else
						Player:AddDamageTarget( DT_SUMMON_MERRY_SPINDROP_FIND_LV1_L, v )
					end			
				end
			elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDROP_LV2 ) ) then
				if ( Player:GetIsRight() ) then
					if(v.x == 0 and v.y == 0 ) then
						Player:AddDamage( DT_SUMMON_MERRY_SPINDROP_LV2_R )
					else
						Player:AddDamageTarget( DT_SUMMON_MERRY_SPINDROP_FIND_LV2_R, v )
					end
				else
					if(v.x == 0 and v.y == 0 ) then
						Player:AddDamage( DT_SUMMON_MERRY_SPINDROP_LV2_L )
					else
						Player:AddDamageTarget( DT_SUMMON_MERRY_SPINDROP_FIND_LV2_L, v )
					end			
				end
			elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDROP_LV3 ) ) then
				if ( Player:GetIsRight() ) then
					if(v.x == 0 and v.y == 0 ) then
						Player:AddDamage( DT_SUMMON_MERRY_SPINDROP_LV3_R )
					else
						Player:AddDamageTarget( DT_SUMMON_MERRY_SPINDROP_FIND_LV3_R, v )
					end
				else
					if(v.x == 0 and v.y == 0 ) then
						Player:AddDamage( DT_SUMMON_MERRY_SPINDROP_LV3_L )
					else
						Player:AddDamageTarget( DT_SUMMON_MERRY_SPINDROP_FIND_LV3_L, v )
					end			
				end
			end
			
        -- ���ɴ뽬
        elseif( 2 == pMonster.m_iRecvStateFromPlayer ) then
			pMonster:PlaySound( 1200104 )
			
			if ( Player:GetIsRight() ) then
				if( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDASH_LV1 ) ) then
					pMonster:AddDamage( DT_SUMMON_MERRY_SPINDASH_LV1_R )
				elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDASH_LV2 ) ) then
					pMonster:AddDamage( DT_SUMMON_MERRY_SPINDASH_LV2_R )
				elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDASH_LV3 ) ) then
					pMonster:AddDamage( DT_SUMMON_MERRY_SPINDASH_LV3_R )
				end
			else
				if( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDASH_LV1 ) ) then
					pMonster:AddDamage( DT_SUMMON_MERRY_SPINDASH_LV1_L )
				elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDASH_LV2 ) ) then
					pMonster:AddDamage( DT_SUMMON_MERRY_SPINDASH_LV2_L )
				elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPINDASH_LV3 ) ) then
					pMonster:AddDamage( DT_SUMMON_MERRY_SPINDASH_LV3_L )
				end
			end
			
        -- �Ͽ︵
        elseif( 3 == pMonster.m_iRecvStateFromPlayer ) then
			pMonster:PlaySound( 1200105 )
			if( Player and Player:CheckSkill( SID_LEY02_BASTION_HOWLING_LV1 ) ) then
				pMonster:AddDamage( DT_SUMMON_MERRY_HOWLING_LV1 )
			elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_HOWLING_LV2 ) ) then
				pMonster:AddDamage( DT_SUMMON_MERRY_HOWLING_LV2 )
			end

        -- ����
        elseif( 4 == pMonster.m_iRecvStateFromPlayer ) then
            pMonster:SetState( "JOCK" )
            pMonster:ResetDelay()
        else
            pMonster:SetState( "WAIT" )
            pMonster:ResetDelay()
        end

        pMonster.m_iRecvStateFromPlayer = 0

    end
end
--]]
--[[
-- ����
function Summon_Merry_JockFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

    if( iFrame == 60 ) then
		if ( Player:GetIsRight() ) then
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_01", 0.225, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_02", 0.225, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_03", 0.225, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_04", 0.225, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_05", 0.225, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_06", 0.225, 0.03, 0.5 )
        else
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_01", -0.29, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_02", -0.29, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_03", -0.29, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_04", -0.29, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_05", 0.174, 0.03, 0.5 )
            pMonster:AddTraceParticleOffset( "Ley01_Merry_Pee_06", 0.174, 0.03, 0.5 )
        end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDeley()
    end
end
--]]


-- �÷����Ӹ� �Ǻ�
function Summon_Merry_Check_Platformer( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsPlatformer() == true ) then
		pMonster:SetState( "WAIT" )
		pMonster:SetSpeedX( 0.0 )
		pMonster:ResetDelay()
	end
end

--[[
-- ���ιٲٱ�
function Summon_Merry_Check_Change_Master( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:ChangeMasterByDistance()
    pMonster:SetState( "WAIT" )
    pMonster:ResetDelay()
end
--]]

-- Ÿ����
function Summon_Merry_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -500, 200, 500, -200 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end  
end

-- Ÿ���� ���
function Summon_Merry_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -600, 400, 600, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

-- Ÿ���� ���� ��
function Summon_Merry_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

-- �ȱ�
function Summon_Merry_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "WALK" )
		pMonster:ResetDelay()
	end
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- ���߱�
function Summon_Merry_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetState( "WAIT" )
	pMonster:ResetDelay()
end

-- ������
function Summon_Merry_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	Summon_Merry_Jump( iMonsterIndex )
	pMonster:SetState( "JUMP" )
	pMonster:ResetDelay()
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- �ٿ�����
function Summon_Merry_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -600, 0, 600, -600 ) == true  and
	    pMonster:CheckStandBlock() == false) then

		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- �������� �Ÿ��˻�
function Summon_Merry_Check_Mother( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetState( "MOVE_MOTHER" )
	pMonster:ResetDelay()
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- �������Է� �ȱ�
function Summon_Merry_Check_MoveMother_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

    local MotherPos = pMonster:GetPlayerPosByMinDistance()
    local DistX = math.abs(pMonster:GetX() - MotherPos.x)    

    if( DistX > 0.2 and 2.0 > DistX ) then
	
		if ( MotherPos.x > pMonster:GetX() ) then
			pMonster:SetIsRight( true );
		else
			pMonster:SetIsRight( false );			
		end
		
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
		
        pMonster:SetState( "MOTHER_WALK" )
        pMonster:ResetDelay()
    else
	
        pMonster:SetSpeedX( 0 )
		
        pMonster:SetState( "WAIT" )
        pMonster:ResetDelay()
    end
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- �������Է� ������
function Summon_Merry_Check_MoveMother_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

    local MotherPos = pMonster:GetPlayerPosByMinDistance()
    local DistX = math.abs(pMonster:GetX() - MotherPos.x)
    local DistY = pMonster:GetY() - MotherPos.y

    if( (DistY > -2.0 and -0.2 > DistY) and 
        (DistX > 0.2 and 2.0 > DistX) and
        pMonster:GetIsContact() == true ) then

        if ( MotherPos.x > pMonster:GetX() ) then
			pMonster:SetIsRight( true );
		else
			pMonster:SetIsRight( false );			
		end

	    local fMonX = pMonster:GetX()
	    local fMonY = pMonster:GetY()
	    fSpeedX = ( MotherPos.x - fMonX ) * 1.5

	    if ( (MotherPos.y - fMonY) == 0.0 ) then
		    MotherPos.y = fMonY + 0.1
	    end
	    
	    fSpeedY = ((MotherPos.y - fMonY) / ((MotherPos.y - fMonY) / 4.0)) + (((MotherPos.y - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	    
	    pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	    pMonster:AddCountValue(1)

	    pMonster:SetSpeedX( fSpeedX * 0.01 )
	    pMonster:SetSpeedY( fSpeedY * 0.01 )
		
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()	    
	end
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- �������Է� �ٿ�����
function Summon_Merry_Check_MoveMother_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )   
	local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )

    local MotherPos = pMonster:GetPlayerPosByMinDistance()
    local DistX = math.abs(pMonster:GetX() - MotherPos.x)
    local DistY = pMonster:GetY() - MotherPos.y

    if( (DistY > 0.2 and 2.0 > DistY) and 
        (DistX > 0.2 and 2.0 > DistX) and
        (pMonster:CheckStandBlock() == false) and
        (pMonster:GetIsContact() == true) ) then

        if ( MotherPos.x > pMonster:GetX() ) then
			pMonster:SetIsRight( true );
		else
			pMonster:SetIsRight( false );			
		end

		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )
		
		pMonster:ResetDelay()
	end
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- �������Է� �����
function Summon_Merry_Check_MoveMother_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetState( "WAIT" )
	pMonster:ResetDelay()
end

-- �������Է� �ڷ���Ʈ �˻�
function Summon_Merry_Check_MoveMother_Teleport( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local MotherPos = pMonster:GetPlayerPosByMinDistance()
    local DistX = math.abs(pMonster:GetX() - MotherPos.x)
    local DistY = pMonster:GetY() - MotherPos.y

    if( (DistY > 2.5 and 10.0 > DistY) or
        (DistX > 2.5 and 10.0 > DistX) ) then
        
		if ( MotherPos.x > pMonster:GetX() ) then
			pMonster:SetIsRight( true );
		else
			pMonster:SetIsRight( false );			
		end
		
        CheckTeleport = 0
        pMonster:SetState( "MOTHER_TELEPORT" )
        pMonster:ResetDelay()
    end
	
	if( pMonster:IsPlatformer() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
	end
end

-- �⺻����
--[[
function Summon_Merry_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local MotherUID = pMonster:GetSummonPlayerUID()
    local Player = g_MyD3D:GetPlayerByUID( MotherUID )
    
    Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )
    
	if( iFrame == 1 ) then
		pMonster:PlaySound( 1201003 )
		pMonster:TurnToTarget()	
		if( Player and Player:CheckSkill( SID_LEY02_BASTION_SPECIAL_LV1 ) ) then
			pMonster:AddDamage( DT_SUMMON_MERRY_ATK01 )
		elseif( Player and Player:CheckSkill( SID_LEY02_BASTION_SPECIAL_LV2 ) ) then
			pMonster:AddDamage( DT_SUMMON_MERRY_ATK01_LV2 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
        pMonster:ResetDeley()
    end
end
--]]

-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnSummon_Merry_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnSummon_Merry_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end
end

function OnSummon_Merry_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		pMonster:TurnToTarget()	
		pMonster:SetPushCheck( false )
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		if( false == pMonster:GetSummonMonsterDieType() ) then
		    pMonster:SetState( "DIE01" )
		else
		    pMonster:SetState( "DIE02" )
        end
	end
end

function OnSummon_Merry_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetPushCheck( true )

    pMonster:SetSpeedX( 0.0 )
    pMonster:SetSpeedY( 0.0 )

	if ( pMonster:FloatRand() < 0.1 ) then	
		if ( pMonster:FloatRand() < 0.2 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "DAMAGE" )	
		end
	end
	
	if( pMonster:GetHP() <= 0 ) then
		pMonster:SetState( "DIE" )
	end
end

function Summon_Merry_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.2) < pMonster:GetTargetY() )then			
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )			
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )			
			pMonster:SetSpeedY( 0.038 )			
		else
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )		
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )			
		end
	end
end

function Summon_Merry_Mother_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
        local MotherPos = pMonster:GetPlayerPosByMinDistance()

		if( pMonster:GetY() - (0.2) < MotherPos.y )then			
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.038 )
		else
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.019 )
		end
	end
end

function Summon_Merry_Jump( iMonsterIndex )
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

function Summon_Merry_CheckUseCommandSkill( iMonsterIndex, iFrame )

    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( 0 < pMonster.m_iRecvStateFromPlayer ) then

        local MotherPos = pMonster:GetPlayerPosByMinDistance()
        local DistX = math.abs(pMonster:GetX() - MotherPos.x)
        local DistY = math.abs(pMonster:GetY() - MotherPos.y)

        if( (0.3 > DistY) and (0.3 > DistX) ) then

			if ( MotherPos.x > pMonster:GetX() ) then
				pMonster:SetIsRight( true );
			else
				pMonster:SetIsRight( false );			
			end
		
            pMonster:SetState( "USE_SKILL" )
            pMonster:ResetDelay()

        -- �Ÿ��� �ָ� �ڷ���Ʈ�� �¿���!!
        else
            CheckTeleport = 0
            pMonster:SetState( "MOTHER_TELEPORT" )
            pMonster:ResetDelay()
        end
    end
end