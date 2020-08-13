-- AI_storm_sisters.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "storm_sisters_Wait.frm",
        Func    = "FuriousStorm_WaitFunc",

        Trigger =
        {

			-- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "FuriousStorm_Targeting",
                DelayFrame          = 100,
            },

            -- Ÿ������
            {
                AICheckFrame        = 150,
                AIFunc              = "FuriousStorm_Check_ReleaseTarget",
                DelayFrame          = 250,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "FuriousStorm_Check_TurnToTarget",
                DelayFrame          = 40,
            },

            -- �ȱ�
            {
                AICheckFrame        = 80,
                AIFunc              = "FuriousStorm_Check_Walk",
                DelayFrame          = 120,
            },

            -- ������ (�ӽ� ����)
            {
                AICheckFrame        = 50,
                AIFunc              = "FuriousStorm_Check_JumpUp",
                DelayFrame          = 200,
            },

            -- �����ٿ�
            {
                AICheckFrame        = 30,
                AIFunc              = "FuriousStorm_Check_JumpDown",
                DelayFrame          = 60,
            },

			-- �ڸž� �����ҷ�?
            {
                AICheckFrame        = 10,
                AIFunc              = "FuriousStorm_Check_Attack01",
                DelayFrame          = 500,
            },

            -- �ܰ� ������~
            {
                AICheckFrame        = 100,
				AICheckFrame1       = 50,
				AICheckFrame2       = 5,
				AICheckFrame3       = 5,
                AIFunc              = "FuriousStorm_Check_Attack02",
                DelayFrame          = 250,
            },

            -- ��������
            {
                AICheckFrame        = 75,
                AIFunc              = "FuriousStorm_Check_JumpAtk",
                DelayFrame          = 300,
            },

            -- ǻ��� ��
            {
                AICheckFrame        = 90,
                AIFunc              = "FuriousStorm_Check_Attack03",
                DelayFrame          = 50,
            },

            -- ���� ��
            {
                AICheckFrame        = 140,
                AIFunc              = "FuriousStorm_Check_Attack04",
                DelayFrame          = 430,
				DelayFrame1			= 330,
				DelayFrame2			= 230,
				DelayFrame3			= 230,
            },

            -- ȸ�� ����
            {
                AICheckFrame        = 200,
                AIFunc              = "FuriousStorm_Check_Attack05",
                DelayFrame          = 900,
				DelayFrame1			= 600,
				DelayFrame2			= 300,
				DelayFrame3			= 300,
            },

        },
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "storm_sisters_run.frm",
        Func            = "storm_sisters_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "FuriousStorm_MoveFail",

        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 10,
                AIFunc              = "FuriousStorm_Targeting",
                DelayFrame          = 40,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 20,
                AIFunc              = "FuriousStorm_Check_TurnToTarget",
                DelayFrame          = 40,
            },
            -- �ܰ� ������~
            {
                AICheckFrame        = 20,
                AIFunc              = "DarkStorm_Check_Attack02",
                DelayFrame          = 80,
            },
            -- ��������
            {
                AICheckFrame        = 35,
                AIFunc              = "DarkStormStorm_Check_JumpAtk",
                DelayFrame          = 105,
            },
            -- �����ٿ�
            {
                AICheckFrame        = 22,
                AIFunc              = "FuriousStorm_Check_JumpDown",
                DelayFrame          = 58,
            },
            -- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "FuriousStorm_Check_Stop",
                DelayFrame          = 60,
            },
        }
    },
        
    -- �ڸſ� �����϶�~
    {
        ID      = "ATTACK01",
        Motion  = "storm_sisters_Attack01.frm",
        Func    = "FuriousStorm_Attack01Func",
    },
    
    -- �ܰ� ������
    {
        ID      = "ATTACK02",
        Motion  = "storm_sisters_Attack02.frm",
        Func    = "FuriousStorm_Attack02Func",
    },
    
    -- ǻ��� ��
    {
        ID      = "ATTACK03",
        Motion  = "storm_sisters_furious_attack03.frm",
        Func    = "FuriousStorm_Attack03Func",
    },
    
    -- ���� ��
    {
        ID      = "ATTACK04",
        Motion  = "storm_sisters_furious_attack04.frm",
        Func    = "FuriousStorm_Attack04Func",
    },
    
    -- ȸ�� ����
    {
        ID      = "ATTACK05",
        Motion  = "storm_sisters_Attack05.frm",
        Func    = "FuriousStorm_Attack05Func",
    },
    
    -- ��Ȱ
    {
        ID      = "REVIVAL",
        Motion  = "storm_sisters_jump.frm",
        Func    = "FuriousStorm_RevivalFunc",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "storm_sisters_jump_up.frm",
        Func    = "FuriousStorm_JumpFunc",
    },
    
    -- ���� ATK
    {
        ID      = "JUMPATK",
        Motion  = "storm_sisters_jump.frm",
        Func    = "FuriousStorm_JumpAtkFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "storm_sisters_jump_down.frm",
        Func    = "FuriousStorm_JumpDownFunc",
    },

    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "storm_sisters_Jump_Landing.frm",
        Func    = "FuriousStorm_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE",
        Motion  = "storm_sisters_damage_middle.frm",
        Func    = "FuriousStorm_DamageFunc",
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "storm_sisters_die.frm",
        Func    = "FuriousStorm_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE_PRETEND",
        Motion  = "storm_sisters_die.frm",
        Func    = "FuriousStorm_DiePretendFunc",
        IsFallDownMotion    = TRUE,
    },
        
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "storm_sisters_stone.frm",
        Func    = "FuriousStorm_StoneCurseFunc",
    },
}

CallBack =
{
    Land    = "OnFuriousStorm_Land",
    Die     = "OnFuriousStorm_Die",
    Damage  = "OnFuriousStorm_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitFuriousStorm( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    
    pMonster:RegisterSummonMonsterType( MON_DARK_STORM )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function FuriousStorm_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function storm_sisters_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �ױ� ����
function FuriousStorm_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(996013)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ����ô!
function FuriousStorm_DiePretendFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame == 1 ) then
        pMonster:PlaySound(996013)
		pMonster:SetInvincible( true )
		pMonster:InitTimer()
		pMonster:StartTimer()
	elseif( iFrame == pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        local bFoundMedic = false
        
        for i = 0 , MAX_MONSTER-1 do
			local pTarget = g_MyD3D:GetMonster( i )
			if( pTarget:GetHP() > 0.0 and pTarget:GetMonsterType() == MON_DARK_STORM ) then
				bFoundMedic = true
				break		
			end		
		end
		
		if ( bFoundMedic == false ) then
			pMonster:EndMonster()
		end	
		
		if ( pMonster:GetHP() > 0 ) then
		    pMonster:SetState( "REVIVAL" )
		end
    end
end

-- ������ ������
function FuriousStorm_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function FuriousStorm_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
    elseif( iFrame == 90 ) then
		local posy = 0.25
		pMonster:AddParticle("Storm_Sisters_Forever_Boom_01", 0.0, posy)
		pMonster:AddParticle("Storm_Sisters_Forever_Boom_02", 0.0, posy)
		pMonster:AddParticle("Storm_Sisters_Forever_Boom_03", 0.0, posy)
		pMonster:PlaySound(996008)
		pMonster:SetHP( pMonster:GetHP() + ( pMonster:GetMaxHP() * 0.1 ) )
		pMon:SetHP( pMonster:GetMaxHP() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
function FuriousStorm_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 46 ) then
		pMonster:PlaySound(996009)
		local posx = 0.25
        local posy = 0.40
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Storm_Sisters_Dagger_01", posx,posy  )
			pMonster:AddParticle( "Storm_Sisters_Dagger_02", posx,posy  )
			pMonster:AddParticle( "Storm_Sisters_Dagger_03", posx,posy  )
			pMonster:AddParticle( "Storm_Sisters_Dagger_04", posx,posy  )
			pMonster:AddDamage(DT_STORMSISTERS_THROWING_DAGGER_R)
		else
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_01", -posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_02_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_03_R", -posx,posy  )
			pMonster:AddParticleNoDirection( "Storm_Sisters_Dagger_04", -posx,posy  )
			pMonster:AddDamage(DT_STORMSISTERS_THROWING_DAGGER_L)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function FuriousStorm_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 56 ) then
		local posx = 0.25
        local posy = 0.25
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Furious_Storm_Furious_Cut_01", posx,posy  )
			pMonster:AddParticle( "Furious_Storm_Furious_Cut_02", posx,posy  )
			pMonster:AddParticle( "Furious_Storm_Furious_Cut_03", posx,posy  )
			pMonster:AddParticle( "Furious_Storm_Furious_Cut_04", posx,posy  )
			pMonster:AddParticle( "Furious_Storm_Furious_Cut_05", posx,posy  )
		else
			pMonster:AddParticleNoDirection( "Furious_Storm_Furious_Cut_01", -posx,posy  )
			pMonster:AddParticleNoDirection( "Furious_Storm_Furious_Cut_02", -posx,posy  )
			pMonster:AddParticleNoDirection( "Furious_Storm_Furious_Cut_03", -posx,posy  )
			pMonster:AddParticleNoDirection( "Furious_Storm_Furious_Cut_04", -posx,posy  )
			pMonster:AddParticleNoDirection( "Furious_Storm_Furious_Cut_05_R", -posx,posy  )
		end
		pMonster:PlaySound(996011)
		pMonster:AddDamage(DT_FURIOUS_CUT)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function FuriousStorm_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 42 ) then
		pMonster:SkillReadyEffect( 255, 100, 40, 0.1 )
	elseif( iFrame == 53 ) then
		pMonster:PlaySound(996010)
		pMonster:AddDamage(DT_STORM_CUT)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function FuriousStorm_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
	elseif( iFrame == 60 ) then
		pMonster:PlaySound(40003)
		pMonster:AddDamage(DT_STORMSISTERS_HEALING_TOTEM_AREA)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function FuriousStorm_RevivalFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:AddParticle("Ronan3_SPECIAL2-1_01", 0.0, 0.12)
		pMonster:AddParticle("Ronan3_SPECIAL2-1_02", 0.0, 0.12)
		pMonster:AddParticle("Ronan3_SPECIAL2-1_04", 0.0, 0.12)
		pMonster:InitTimer()
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:AddDamage(DT_STORMSISTERS_JUMPATK)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function FuriousStorm_JumpAtkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 59 ) then
		pMonster:AddDamage(DT_STORMSISTERS_JUMPATK)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function FuriousStorm_JumpFunc( iMonsterIndex, iFrame )
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
function FuriousStorm_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function FuriousStorm_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function FuriousStorm_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_PRETEND" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function FuriousStorm_IceCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_PRETEND" )
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function FuriousStorm_HoldFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE_PRETEND" )
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------

function FuriousStorm_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1600, 1000, 1600, -1000 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function FuriousStorm_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 0, -800, 800, 800, -800 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 800, -500, 1000, 500, -1000 ) == true and pMonster:FloatRand() < 0.8) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -100, 800, 100, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function FuriousStorm_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	local pMon = g_MyD3D:GetMonster( 1 )
	-- ���� ��ũ������ Ÿ�̸Ӹ� ���� �´�! Ÿ�̸Ӵ� ��ũ ������ �׾��� ��, �ʱ�ȭ �Ǿ� ����ǰ�,
	-- ������ 10�ʰ� ������ ǻ��� ������ üũ�ؼ� �츰��!
	-- ��ũ������ ��Ƴ��� �ڽ��� Ÿ�̸Ӹ� �ʱ�ȭ�ϰ� ����!( �ʱ�ȭ�ϸ� ���� ���� )
	if( pMon:GetHP() <= 0.0 and pMon:GetTimer() >= 55 * 10 ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 520, -250, 180, 250, -80 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 130, -130, 180, 130, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:CheckTargetInRange( 460, -460, 200, 460, -80 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_JumpAtk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -250, 800, 250, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		FuriousStorm_Jump( iMonsterIndex )
		pMonster:SetState( "JUMPATK" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 600, 200, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		FuriousStorm_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -300, -120, 300, -1000 ) == true ) then
		fSpeedX = ( pMonster:GetTargetX() - pMonster:GetX() ) * 1.5

		pMonster:TurnToTarget()
		pMonster:SetSpeedX( fSpeedX * 0.01 )
		pMonster:SetSpeedY( 0.01 )
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:ResetDelay()
	end
end

function FuriousStorm_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -130, 100, 130, -140 ) == true ) then
		if ( pMonster:FloatRand() < 0.6 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetState( "WAIT" )
		end
		pMonster:ResetDelay()
	end
end
-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnFuriousStorm_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnFuriousStorm_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_PRETEND" )
end

function OnFuriousStorm_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	if( pMonster:GetIsContact() == true and pMonster:IsSuperArmor() == false  )then
		if( pMonster:FloatRand() < 0.1 ) then
			pMonster:SetSuperArmor( true )
			pMonster:TurnToTarget()
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK05" )
			else
				pMonster:SetState( "ATTACK04" )
			end
		end
	end
end

function FuriousStorm_Jump( iMonsterIndex )
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

function FuriousStorm_MoveFail( iMonsterIndex )
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