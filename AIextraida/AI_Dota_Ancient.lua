-- AI_Dota_Ancient.lua

ActionList =
{	
    -- ���
    {
        ID      = "WAIT",
        Motion  = "ancient_weapon_wait_A.frm",
        Func    = "Ancient_WaitFunc",
		
        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 10,
                AIFunc              = "Ancient_Check_Targeting",
                DelayFrame          = 27,
            },

			-- ����1 (������)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack01",
                DelayFrame          = 55,
            },
            
			 --����2 (����)
            {
                AICheckFrame        = 5,
                AIFunc              = "Ancient_Check_Attack02",
                DelayFrame          = 10,
            },
			
			 --����3 (���� ������)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack03",
                DelayFrame          = 55,
            },
		}
    },

    -- ��� R
    {
        ID      = "WAIT_R",
        Motion  = "ancient_weapon_wait_B.frm",
        Func    = "Ancient_WaitFunc",
		
        Trigger =
        {
			-- Ÿ����
            {
                AICheckFrame        = 10,
                AIFunc              = "Ancient_Check_Targeting",
                DelayFrame          = 27,
            },

			-- ����1 (������)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack01",
                DelayFrame          = 27,
            },
            
			 --����2 (����)
            {
                AICheckFrame        = 5,
                AIFunc              = "Ancient_Check_Attack02",
                DelayFrame          = 10,
            },
			
			 --����3 (���� ������)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack03",
                DelayFrame          = 27,
            },
		}
    },	
	
    -- �̵�
    {
        ID              = "WALK",
        Motion          = "ancient_weapon_wait_A.frm",
        Func            = "Ancient_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Ancient_MoveFail",
    },

    -- �̵� R
    {
        ID              = "WALK_R",
        Motion          = "ancient_weapon_wait_B.frm",
        Func            = "Ancient_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Ancient_MoveFail",
    },
    
    -- ����1
    {
        ID      = "ATTACK01",
        Motion  = "ancient_weapon_attack01_A.frm",
        Func    = "Ancient_Attack01Func",
    },
    -- ����2
    {
        ID      = "ATTACK02",
        Motion  = "ancient_weapon_attack02_A.frm",
        Func    = "Ancient_Attack02Func",
    },
    -- ����1_R
    {
        ID      = "ATTACK01_R",
        Motion  = "ancient_weapon_attack01_B.frm",
        Func    = "Ancient_Attack01Func",
    },
    -- ����2_R
    {
        ID      = "ATTACK02_R",
        Motion  = "ancient_weapon_attack02_B.frm",
        Func    = "Ancient_Attack02Func",
    },
	
    -- �ٿ� ����
    {
        ID      = "JUMP_DOWN",
        Motion  = "ancient_weapon_wait_A.frm",
        Func    = "Ancient_JumpDownFunc",
    },
    -- �ٿ� ���� R
    {
        ID      = "JUMP_DOWN_R",
        Motion  = "ancient_weapon_wait_B.frm",
        Func    = "Ancient_JumpDownFunc",
    },	
    -- ���� �� ����
    {
        ID      = "JUMP_LANDING",
        Motion  = "ancient_weapon_wait_A.frm",
        Func    = "Ancient_JumpToWait",
    },
    -- ���� �� ���� R
    {
        ID      = "JUMP_LANDING_R",
        Motion  = "ancient_weapon_wait_B.frm",
        Func    = "Ancient_JumpToWait",
    },
    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "ancient_weapon_die_A.frm",
        Func    = "Ancient_DieFunc",
    },
    -- �ױ� R
    {
        ID      = "DIE_R",
        Motion  = "ancient_weapon_die_B.frm",
        Func    = "Ancient_DieFunc",
    },
    -- ����Ŀ��
    {
        ID      = "STONECURSE",
        Motion  = "ancient_weapon_wait.frm",
        Func    = "Ancient_StoneCurseFunc",
    },
    -- �������
    {
        ID      = "ICECURSE",
        Motion  = "ancient_weapon_wait.frm",
        Func    = "Ancient_IceCurseFunc",
    },
    -- Ȧ�����
	{
		ID		= "HOLD",
		Motion	= "ancient_weapon_wait.frm",
		Func	= "Ancient_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnAncient_Land",
    Die     = "OnAncient_Die",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitAncient( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL, "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )
	pMonster:RegistReaction( ATTACKTYPE_HOLD,	ATTACKDIR_NORMAL, "HOLD" )

    pMonster:SetPushCheck( true )
    pMonster:SetSuperArmor( true )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function Ancient_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	if( iFrame == 15 ) then
		pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "WALK" )
		else
			pMonster:SetState( "WALK_R" )
		end
	end
end

-- �ȱ� ����
function Ancient_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
       
	if( ( pMonster:IsTargetMonsterType( MON_DOTA_GUARD_TOWER ) or
		  pMonster:IsTargetMonsterType( MON_DOTA_GUARDIAN_TOWER ) or
		  pMonster:IsTargetMonsterType( MON_DOTA_CORE ) ) and
	      pMonster:IsInvincible() == false and
          pMonster:CheckTargetInRange( 0, -60, 10, 60, -10 ) == true ) then

		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "ATTACK02" )
		else
			pMonster:SetState( "ATTACK02_R" )
		end
    end
	
    pMonster:SetSpeedX( pMonster:GetRunSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "WAIT" )
		else
			pMonster:SetState( "WAIT_R" )
		end
    end
end

-- �ױ�
function Ancient_DieFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		--pMonster:PlaySound(998044)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(false, true)
        pMonster:SetFrameLock( true )
    end
end

--  ����1 (������)
function Ancient_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
	if( iFrame == 40 ) then
		pMonster:PlaySound(984026)
        if( 0 == pMonster.Team ) then
			pMonster:AddDamage( DT_DOTA_ANCIENT_SERDIN_TARGET )
		else
			pMonster:AddDamage( DT_DOTA_ANCIENT_CANABAN_TARGET )
		end
	elseif( iFrame == 43 ) then
        if( 0 == pMonster.Team ) then
		
			if (pMonster:GetIsRight() ) then
				local posx = 0.16
				local posy = 0.40
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_01", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_02", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_03", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_04", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_05", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_06", posx, posy)
			else
				local posx = -0.16
				local posy = 0.40
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_01_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_02_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_03", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_04_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_05_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterR_Beam_06_R", posx, posy)
			end
			
		else
			
			if (pMonster:GetIsRight() ) then
				local posx = 0.16
				local posy = 0.40
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_01", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_02", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_03", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_04", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_05", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_06", posx, posy)
			else
				local posx = -0.16
				local posy = 0.40
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_01_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_02_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_03", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_04_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_05_R", posx, posy)
				pMonster:AddParticleNoDirection("Dota_MonsterB_Beam_06_R", posx, posy)
			end
			
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then

        if( false == pMonster:IsTarget() ) then
            pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
        end
        
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "WAIT" )
		else
			pMonster:SetState( "WAIT_R" )
		end
    end
end

--  ����2 (����)
function Ancient_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame == pMonster:GetLastFrame() - 1 ) then
		pMonster:PlaySound(984027)
		pMonster:AddDamage( DT_DOTA_ANCIENT_BOOM )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        if( false == pMonster:IsTarget() ) then
            pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
        end
        pMonster:EndMonster(false, true)
    end
end

--  ���� �ٿ� ����
function Ancient_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  ���� �� ����
function Ancient_JumpToWait( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:GetIsContact() == true )then
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "WALK" )
		else
			pMonster:SetState( "WALK_R" )
		end
    end
end

--  ����Ŀ�� �ɷ���
function Ancient_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:AddTraceParticle( "StoneCurse_small", 3 )
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_small_tick", 0.0, 0.0 )
        pMonster:SetInvincible( false )
        pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "WAIT" )
		else
			pMonster:SetState( "WAIT_R" )
		end
        
        if( pMonster:GetHP() <= 0 ) then
			if( pMonster:GetIsRight() == true ) then
				pMonster:SetState( "DIE" )
			else
				pMonster:SetState( "DIE_R" )
			end
		end
    end
end

--  ���̽�Ŀ�� �ɷ���
function Ancient_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:AddTraceParticle( "IceCurse_small", 3 )
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_small_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_small_tick", 0.0, 0.0 )
        pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "WAIT" )
		else
			pMonster:SetState( "WAIT_R" )
		end
        
        if( pMonster:GetHP() <= 0 ) then
			if( pMonster:GetIsRight() == true ) then
				pMonster:SetState( "DIE" )
			else
				pMonster:SetState( "DIE_R" )
			end
		end
    end
end


-- Ȧ�� �ɷ���(����Ʈ)
function Ancient_HoldFunc( iMonsterIndex, iFrame )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	if( iFrame <= 1 ) then
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_01_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_02_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_03_Small", 0.0, 0.12 )
		pMonster:AddParticle( "Arme01_Hold_Beam_effect_04_Small", 0.0, 0.12 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "WAIT" )
		else
			pMonster:SetState( "WAIT_R" )
		end

		if( pMonster:GetHP() <= 0 ) then
			if( pMonster:GetIsRight() == true ) then
				pMonster:SetState( "DIE" )
			else
				pMonster:SetState( "DIE_R" )
			end
		end
	end
end

-----------------------------------------------------------------------
-- �����üũ : ���常 ����
-----------------------------------------------------------------------

function Ancient_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -300, 100, 300, -100 ) == true ) then
		pMonster:TurnToTarget()	
        pMonster:ResetDelay()
    end
end

-- ����������
function Ancient_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 50, -150, 10, 150, -10 ) == true ) then
		if( pMonster:IsTarget() == true ) then
			if( pMonster:GetIsRight() == true ) then
				pMonster:SetState( "ATTACK01" )
			else
				pMonster:SetState( "ATTACK01_R" )
			end
		end
	end
end

-- �ڵ��� ����������
function Ancient_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( -50, -100, 10, 100, -10 ) == true ) then
		if( pMonster:IsTarget() == true ) then
			pMonster:TurnToTarget()
			if( pMonster:GetIsRight() == true ) then
				pMonster:SetState( "ATTACK01" )
			else
				pMonster:SetState( "ATTACK01_R" )
			end
		end
	end
end

-- ����
function Ancient_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -50, 100, 50, -100 ) == true and pMonster:IsTargetMonster() == true ) then
	    if( pMonster:IsTargetMonsterType( MON_DOTA_GUARD_TOWER ) or
		    pMonster:IsTargetMonsterType( MON_DOTA_GUARDIAN_TOWER ) or
		    pMonster:IsTargetMonsterType( MON_DOTA_CORE ) ) then

			if( pMonster:IsTarget() == true ) then
				if( pMonster:GetIsRight() == true ) then
					pMonster:SetState( "ATTACK02" )
				else
					pMonster:SetState( "ATTACK02_R" )
				end
				pMonster:ResetDelay()
			end
		end
	end
end


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnAncient_Land( iMonsterIndex )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP_DOWN" ) or pMonster:CheckState( "JUMP_DOWN_R" ) == true ) then
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "JUMP_LANDING" )
		else
			pMonster:SetState( "JUMP_LANDING_R" )
		end
    end
end

function OnAncient_Die( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

    pMonster:SetInvincible( true )
		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "DIE" )
		else
			pMonster:SetState( "DIE_R" )
		end
end

-- �ȴٰ� ����������� : �̾��� ���Ǻ��� �������( ��?? �������Ǻ��� ����~ ���н���!! )
function Ancient_MoveFail( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    -- �ٴڿ� �پ� ������
	if( pMonster:GetIsContact() == true )then
        
        -- ���� �ִٸ� ������ �ٲپ��
        if( pMonster:CheckSideBlock() == true ) then
		    pMonster:SetIsRight( not pMonster:GetIsRight() )
		    
        -- �ƴϸ� �ھ ������!
        else
		    pMonster:SetIsRight( pMonster:GetDotaGateIsRight() )
        end

        pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.5 )
	    pMonster:SetSpeedY( 0.015 )
        pMonster:SetNoCheckContact(10)

		if( pMonster:GetIsRight() == true ) then
			pMonster:SetState( "JUMP_DOWN" )
		else
			pMonster:SetState( "JUMP_DOWN_R" )
		end

        pMonster:ResetDelay()
	end
end