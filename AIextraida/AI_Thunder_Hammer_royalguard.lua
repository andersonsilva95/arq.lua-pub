-- AI_Thunder_Hammer_Defender.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "Thunder_Hammer_Defender_Wait.frm",
        Func    = "Thunder_Hammer_Defender_WaitFunc",

        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 20,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Targeting",
                DelayFrame          = 40,
            },

            -- Ÿ���� ���� ��
            {
                AICheckFrame        = 15,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_TurnToTarget",
                DelayFrame          = 10,
            },

            -- �ȱ�
            {
                AICheckFrame        = 20,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Walk",
                DelayFrame          = 100,
				DelayFrame1         = 50,
				DelayFrame2         = 10,
				DelayFrame3         = 10,
            },

            -- ������
            {
                AICheckFrame        = 31,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_JumpUp",
                DelayFrame          = 30,
            },        

            -- �����ٿ�
            {
                AICheckFrame        = 22,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_JumpDown",
                DelayFrame          = 20,
            },

			-- ������ �׽�
            {
                AICheckFrame        = 5,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Attack01",
                DelayFrame          = 55,
            },

            -- ��������
            {
                AICheckFrame        = 2,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Attack02",
                DelayFrame          = 110,
            },

            -- ���ϵ� í��
            {
                AICheckFrame        = 11,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Attack03",
                DelayFrame          = 222,
            },

			-- ��ο� �ٿ�
            {
                AICheckFrame        = 6,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Attack04",
                DelayFrame          = 166,
            },

		},
    },

    -- �̵�
    {
        ID              = "WALK",
        Motion          = "Thunder_Hammer_Defender_move.frm",
        Func            = "Thunder_Hammer_Defender_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Thunder_Hammer_Defender_MoveFail",


        Trigger =
        {
			-- Ÿ����
			{
                AICheckFrame        = 10,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Targeting",
                DelayFrame          = 20,
            },
			-- Ÿ���� ���� ��
            {
                AICheckFrame        = 10,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- ������
            {
                AICheckFrame        = 21,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_JumpUp",
                DelayFrame          = 40,
            },        
            -- �����ٿ�
            {
                AICheckFrame        = 22,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_JumpDown",
                DelayFrame          = 20,
            },
            -- ���߱�
            {
                AICheckFrame        = 5,
                AIFunc              = "Thunder_Hammer_RoyalGuard_Check_Stop",
                DelayFrame          = 55,
            },
        }
    },

    -- ��������
    {
        ID      = "ATTACK01",
        Motion  = "Thunder_Hammer_Defender_Attack01.frm",
        Func    = "Thunder_Hammer_Defender_Attack01Func",
    },
    
    -- ��������2
    {
        ID      = "ATTACK02",
        Motion  = "Thunder_Hammer_Defender_Attack02.frm",
        Func    = "Thunder_Hammer_Defender_Attack02Func",
    },
    
    -- ��������3
    {
        ID      = "ATTACK03",
        Motion  = "Thunder_Hammer_Defender_Attack03.frm",
        Func    = "Thunder_Hammer_Defender_Attack03Func",
    },
    
    -- ��������3
    {
        ID      = "ATTACK04",
        Motion  = "Thunder_Hammer_Defender_Attack04.frm",
        Func    = "Thunder_Hammer_Defender_Attack04Func",
    },
    
    -- ����
    {
        ID      = "JUMP",
        Motion  = "Thunder_Hammer_Defender_Jump_Up.frm",
        Func    = "Thunder_Hammer_Defender_JumpFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "Thunder_Hammer_Defender_Jump_Down.frm",
        Func    = "Thunder_Hammer_Defender_JumpDownFunc",
    },
    
    -- ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "Thunder_Hammer_Defender_Jump_Landing.frm",
        Func    = "Thunder_Hammer_Defender_ToWait",
    },

    -- ������ ��
    {
        ID      = "DAMAGE_UP",
        Motion  = "Thunder_Hammer_Defender_damage_middle.frm",
        Func    = "Thunder_Hammer_Defender_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Thunder_Hammer_Defender_Damage_Middle.frm",
        Func    = "Thunder_Hammer_Defender_DamageFunc",
    },
    
    -- ������ ��
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Thunder_Hammer_Defender_damage_middle.frm",
        Func    = "Thunder_Hammer_Defender_DamageFunc",
    },
    
    -- �ٿ� �� 
    {
        ID      = "DOWN",
        Motion  = "Thunder_Hammer_Defender_down.frm",
        Func    = "Thunder_Hammer_Defender_DownFunc",
        IsFallDownMotion    = TRUE,
        
		--[[
        Trigger =
        {
            {
                AICheckFrame        = 5,
                AIFunc              = "Thunder_Hammer_RoyalGuard_CheckStandup",
                DelayFrame          = 0,
            },
        }
		--]]
    },
    
    -- �Ͼ��
    {
        ID      = "STANDUP",
        Motion  = "Thunder_Hammer_Defender_standup.frm",
        Func    = "Thunder_Hammer_Defender_StandupFunc",
    },
    
    -- �Ͼ��
    {
        ID      = "SUMMON",
        Motion  = "Thunder_Hammer_Defender_standup.frm",
        Func    = "Thunder_Hammer_Defender_SummonFunc",
    },

    -- �ױ� ����
    {
        ID      = "DIE_LANDING",
        Motion  = "Thunder_Hammer_Defender_Die02.frm",
        Func    = "Thunder_Hammer_Defender_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- �ױ� ����
    {
        ID      = "DIE",
        Motion  = "Thunder_Hammer_Defender_Die01.frm",
        Func    = "Thunder_Hammer_Defender_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
        
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "Thunder_Hammer_Defender_Stone.frm",
        Func    = "Thunder_Hammer_Defender_StoneCurseFunc",
    },
    
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "Thunder_Hammer_Defender_Stone.frm",
        Func    = "Thunder_Hammer_Defender_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "Thunder_Hammer_Defender_Stone.frm",
		Func	= "Thunder_Hammer_Defender_HoldFunc",
	},

}

CallBack =
{
    Land    = "OnThunder_Hammer_Defender_Land",
    Die     = "OnThunder_Hammer_Defender_Die",
    Damage  = "OnThunder_Hammer_Defender_Damage",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitThunder_Hammer_Defender( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegistReaction(	ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL,	"HOLD"	)
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_MIDDLE" )
	
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
    
    if( pMonster:GetGameMode() == GC_GM_QUEST44 ) then
		pMonster.Team = 0
    end
    
    pMonster:AddTraceParticleToBone( "Dwarf_Eyes", 0.5, 8, 2, 8, 0.0, 0.0 )
    pMonster:AddTraceParticleToBone( "Dwarf_Eyes", 0.5, 9, 2, 8, 0.0, 0.0 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Thunder_Hammer_Defender_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:GetGameMode() == GC_GM_QUEST44 ) then
		g_kCamera.WideMode = 8
    end

    pMonster.DefRatio = 1.0
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- �ȱ� ����
function Thunder_Hammer_Defender_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- �ױ� ����
function Thunder_Hammer_Defender_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(987011)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- ������ ������
function Thunder_Hammer_Defender_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- �ٿ�
function Thunder_Hammer_Defender_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
		if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE_LANDING" )
		else
			pMonster:SetState( "STANDUP" )
		end
    end
end


-- �Ͼ��
function Thunder_Hammer_Defender_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
	elseif( iFrame == 43 ) then
		pMonster:PlaySound(987012)
    elseif( iFrame == 45 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_DEFENDER_SHIELD)
	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end


-- �Ͼ��
function Thunder_Hammer_Defender_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_DEFENDER_SHIELD)
	--elseif( iFrame == 48 ) then
		pMonster:PlaySound(987012)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

--  �������� ����
function Thunder_Hammer_Defender_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster.DefRatio = 1.0
	elseif( iFrame == 56 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_DEFENDER_ATK1)
		pMonster:PlaySound(987013)
		local posx = 0.1
		local posy = 0.2
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("THDefender_Slash_R", posx, posy)
		else
			pMonster:AddParticleNoDirection("THDefender_Slash", posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  ��������2 ����
function Thunder_Hammer_Defender_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster.DefRatio = 1.0
	elseif( iFrame == 49 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_DEFENDER_ATK2)
		pMonster:PlaySound(987014)
	elseif( iFrame == 53 ) then
		pMonster:AddParticleNoDirection("Dinergate_Upper_02", 0.0, 0.0)
		local posx = 0.0
		local posy = 0.25
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("THDefender_SwingUP_R", posx, posy)
		else
			pMonster:AddParticleNoDirection("THDefender_SwingUP", posx, posy)
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Thunder_Hammer_Defender_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster.DefRatio = 1.0
	elseif( iFrame == 18 ) then
		pMonster:PlaySound(987015)
	elseif( iFrame == 20 ) then
		pMonster:AddParticleNoDirection("THDefender_Shout", 0.0, 0.0)
	elseif( iFrame == 45 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_DEFENDER_ATK3_1)
		pMonster:AddTraceParticleToBone( "Larva_Scratch", 1.0, -1, 8, 8, 0.0, 0.0, false )
	elseif( iFrame == 92 ) then
		local posx = 0.1
		local posy = 0.2
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
			pMonster:AddParticleNoDirection("THDefender_Swing_01_R", posx, posy)
			pMonster:AddParticleNoDirection("THDefender_Swing_02_R", posx, posy)
		else
			pMonster:AddParticleNoDirection("THDefender_Swing_01", posx, posy)
			pMonster:AddParticleNoDirection("THDefender_Swing_02", posx, posy)
		end
	--elseif( iFrame == 93 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_DEFENDER_ATK3)
	--elseif( iFrame == 96 ) then
		pMonster:PlaySound(987014)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--
function Thunder_Hammer_Defender_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster.DefRatio = 1.0
	elseif( iFrame == 35 ) then
		pMonster:SkillReadyEffectNoStop( 255, 128, 128, 0.20 )
	elseif( iFrame == 55 ) then
		pMonster:ComputeAngleToTarget( 0.11, 0.00 ) -- Ÿ�������� ������ ���
		local angle = pMonster:GetAngleToTarget()
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_ROYAL_GUARD_ATK1, 0.11, 0.18, false, angle )
		else
			pMonster:AddDamageWithLocateAngle( DT_THUNDER_HAMMER_ROYAL_GUARD_ATK1, 0.11, 0.18, false, -angle )
		end
		pMonster:PlaySound(987013)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ���� ����
function Thunder_Hammer_Defender_JumpFunc( iMonsterIndex, iFrame )
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
function Thunder_Hammer_Defender_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� ����
function Thunder_Hammer_Defender_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  ����Ŀ�� �ɷ���
function Thunder_Hammer_Defender_StoneCurseFunc( iMonsterIndex, iFrame )
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
			pMonster:SetState( "DIE" )
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Thunder_Hammer_Defender_IceCurseFunc( iMonsterIndex, iFrame )
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
function Thunder_Hammer_Defender_HoldFunc( iMonsterIndex, iFrame )
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

function Thunder_Hammer_RoyalGuard_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 300, -900, 400, 900, -400 ) == true ) then
		pMonster:TurnToTarget()
		
        pMonster:ResetDelay()
    end
end

function Thunder_Hammer_RoyalGuard_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Thunder_Hammer_RoyalGuard_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -220, 600, 220, -600 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Thunder_Hammer_RoyalGuard_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -220, 600, 220, -600 ) == true ) then
		pMonster:SetSpeedX( 0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Thunder_Hammer_RoyalGuard_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 120, -120, 50, 120, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Thunder_Hammer_RoyalGuard_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -150, 180, 150, 50 ) == true and pMonster:GetTargetIsContact() == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Thunder_Hammer_RoyalGuard_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 50, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Thunder_Hammer_RoyalGuard_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 230, -250, 50, 250, -500 ) == true ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Thunder_Hammer_RoyalGuard_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 400, 300, 80 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Thunder_Hammer_Defender_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Thunder_Hammer_RoyalGuard_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end


function Thunder_Hammer_RoyalGuard_CheckStandup( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetHP() > 0 and pMonster:GetDownDelay() == 0 ) then
		pMonster:SetState( "STANDUP" )
    end
end
-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnThunder_Hammer_Defender_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnThunder_Hammer_Defender_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( 0.0 )

	pMonster:SetState( "DIE" )
end

function OnThunder_Hammer_Defender_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end

	if( pMonster:CheckState( "STANDUP" ) == false and pMonster:CheckState( "DOWN" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			if( pMonster:CheckTargetInRange( 0, -999, 50, 999, -900 ) == true ) then
				pMonster:SetState( "ATTACK04" )
			else
				pMonster:SetState( "ATTACK03" )
			end
		end
	end
end

function Thunder_Hammer_Defender_Jump( iMonsterIndex )
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
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function Thunder_Hammer_Defender_MoveFail( iMonsterIndex )
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