-- AI_Dota_Ancient.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "ancient_weapon_wait_A.frm",
        Func    = "Ancient_WaitFunc",
		
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "Ancient_Check_Targeting",
                DelayFrame          = 27,
            },

			-- 공격1 (레이저)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack01",
                DelayFrame          = 55,
            },
            
			 --공격2 (자폭)
            {
                AICheckFrame        = 5,
                AIFunc              = "Ancient_Check_Attack02",
                DelayFrame          = 10,
            },
			
			 --공격3 (돌아 레이저)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack03",
                DelayFrame          = 55,
            },
		}
    },

    -- 대기 R
    {
        ID      = "WAIT_R",
        Motion  = "ancient_weapon_wait_B.frm",
        Func    = "Ancient_WaitFunc",
		
        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "Ancient_Check_Targeting",
                DelayFrame          = 27,
            },

			-- 공격1 (레이저)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack01",
                DelayFrame          = 27,
            },
            
			 --공격2 (자폭)
            {
                AICheckFrame        = 5,
                AIFunc              = "Ancient_Check_Attack02",
                DelayFrame          = 10,
            },
			
			 --공격3 (돌아 레이저)
            {
                AICheckFrame        = 20,
                AIFunc              = "Ancient_Check_Attack03",
                DelayFrame          = 27,
            },
		}
    },	
	
    -- 이동
    {
        ID              = "WALK",
        Motion          = "ancient_weapon_wait_A.frm",
        Func            = "Ancient_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Ancient_MoveFail",
    },

    -- 이동 R
    {
        ID              = "WALK_R",
        Motion          = "ancient_weapon_wait_B.frm",
        Func            = "Ancient_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Ancient_MoveFail",
    },
    
    -- 공격1
    {
        ID      = "ATTACK01",
        Motion  = "ancient_weapon_attack01_A.frm",
        Func    = "Ancient_Attack01Func",
    },
    -- 공격2
    {
        ID      = "ATTACK02",
        Motion  = "ancient_weapon_attack02_A.frm",
        Func    = "Ancient_Attack02Func",
    },
    -- 공격1_R
    {
        ID      = "ATTACK01_R",
        Motion  = "ancient_weapon_attack01_B.frm",
        Func    = "Ancient_Attack01Func",
    },
    -- 공격2_R
    {
        ID      = "ATTACK02_R",
        Motion  = "ancient_weapon_attack02_B.frm",
        Func    = "Ancient_Attack02Func",
    },
	
    -- 다운 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "ancient_weapon_wait_A.frm",
        Func    = "Ancient_JumpDownFunc",
    },
    -- 다운 점프 R
    {
        ID      = "JUMP_DOWN_R",
        Motion  = "ancient_weapon_wait_B.frm",
        Func    = "Ancient_JumpDownFunc",
    },	
    -- 점프 후 착지
    {
        ID      = "JUMP_LANDING",
        Motion  = "ancient_weapon_wait_A.frm",
        Func    = "Ancient_JumpToWait",
    },
    -- 점프 후 착지 R
    {
        ID      = "JUMP_LANDING_R",
        Motion  = "ancient_weapon_wait_B.frm",
        Func    = "Ancient_JumpToWait",
    },
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "ancient_weapon_die_A.frm",
        Func    = "Ancient_DieFunc",
    },
    -- 죽기 R
    {
        ID      = "DIE_R",
        Motion  = "ancient_weapon_die_B.frm",
        Func    = "Ancient_DieFunc",
    },
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "ancient_weapon_wait.frm",
        Func    = "Ancient_StoneCurseFunc",
    },
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "ancient_weapon_wait.frm",
        Func    = "Ancient_IceCurseFunc",
    },
    -- 홀드상태
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
-- 초기화 함수
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
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
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

-- 걷기 상태
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

-- 죽기
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

--  공격1 (레이저)
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

--  공격2 (자폭)
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

--  점프 다운 상태
function Ancient_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 후 착지
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

--  스톤커스 걸렸음
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

--  아이스커스 걸렸음
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


-- 홀드 걸렸음(이펙트)
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
-- 컨디션체크 : 방장만 실행
-----------------------------------------------------------------------

function Ancient_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -300, 100, 300, -100 ) == true ) then
		pMonster:TurnToTarget()	
        pMonster:ResetDelay()
    end
end

-- 직선레이저
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

-- 뒤돌아 직선레이저
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

-- 자폭
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
-- 콜백 함수
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

-- 걷다가 실패했을경우 : 이어진 발판블럭이 없을경우( 어?? 다음발판블럭이 없네~ 실패실패!! )
function Ancient_MoveFail( iMonsterIndex )
	local pMonster = MonsterManager:GetMonster( iMonsterIndex )

    -- 바닥에 붙어 있으면
	if( pMonster:GetIsContact() == true )then
        
        -- 벽이 있다면 방향을 바꾸어라
        if( pMonster:CheckSideBlock() == true ) then
		    pMonster:SetIsRight( not pMonster:GetIsRight() )
		    
        -- 아니면 코어를 향하자!
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