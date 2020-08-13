-- AI_Guardian.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Guardian_Wait.frm",
        Func    = "Guardian_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 40,
                AIFunc              = "Guardian_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            --{
            --    AICheckFrame        = 300,
            --    AIFunc              = "Guardian_Check_ReleaseTarget",
            --    DelayFrame          = 200,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "Guardian_Check_TurnToTarget",
                DelayFrame          = 15,
            },

            -- 걷기
            {
                AICheckFrame        = 10,
                AIFunc              = "Guardian_Check_Walk",
                DelayFrame          = 30,
            },

            -- 점프업
            {
                AICheckFrame        = 31,
                AIFunc              = "Guardian_Check_JumpUp",
                DelayFrame          = 30,
            },        

            -- 점프다운
            {
                AICheckFrame        = 22,
                AIFunc              = "Guardian_Check_JumpDown",
                DelayFrame          = 10,
            },

			-- 샤이닝 소드
            {
                AICheckFrame        = 5,
                AIFunc              = "Guardian_Check_Attack01",
                DelayFrame          = 120,
            },

            -- 이터널 소드
            {
                AICheckFrame        = 6,
                AIFunc              = "Guardian_Check_Attack02",
                DelayFrame          = 210,
            },

            -- 해븐즈 소드
            {
                AICheckFrame        = 10,
                AIFunc              = "Guardian_Check_Attack03",
                DelayFrame          = 290,
            },

        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Guardian_walk.frm",
        Func            = "Guardian_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Guardian_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "Guardian_Check_Targeting",
                DelayFrame          = 30,
            },
            -- 타겟지움
            --{
            --    AICheckFrame        = 200,
            --    AIFunc              = "Guardian_Check_ReleaseTarget",
            --    DelayFrame          = 100,
            --},
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "Guardian_Check_TurnToTarget",
                DelayFrame          = 15,
            },
            -- 점프업
            {
                AICheckFrame        = 21,
                AIFunc              = "Guardian_Check_JumpUp",
                DelayFrame          = 30,
            },        
            -- 점프다운
            {
                AICheckFrame        = 22,
                AIFunc              = "Guardian_Check_JumpDown",
                DelayFrame          = 10,
            },
            -- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "Guardian_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "Guardian_Attack01.frm",
        Func    = "Guardian_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "Guardian_Attack02.frm",
        Func    = "Guardian_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "Guardian_Attack03.frm",
        Func    = "Guardian_Attack03Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Guardian_Jump_Up.frm",
        Func    = "Guardian_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Guardian_Jump_Down.frm",
        Func    = "Guardian_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Guardian_Jump_Landing.frm",
        Func    = "Guardian_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "Guardian_Damage_Up.frm",
        Func    = "Guardian_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "Guardian_Damage_Middle.frm",
        Func    = "Guardian_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "Guardian_Damage_Down.frm",
        Func    = "Guardian_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Guardian_Die.frm",
        Func    = "Guardian_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
        
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "Guardian_Stone.frm",
        Func    = "Guardian_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "Guardian_Stone.frm",
        Func    = "Guardian_IceCurseFunc",
    },
    -- 홀드상태
	{
		ID		= "HOLD",
		Motion	= "Guardian_Stone.frm",
		Func	= "Guardian_HoldFunc",
	},
}

CallBack =
{
    Land    = "OnGuardian_Land",
    Die     = "OnGuardian_Die",
    Damage  = "OnGuardian_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGuardian( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_DOWN" )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Guardian_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Guardian_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function Guardian_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(991010)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Guardian_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Guardian_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 86 ) then
		pMonster:AddDamage(DT_GUARDIANKUNG_SHININGSWORD)

		local posx = 0.0
		local posy = 0.2
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_01_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_02", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_03_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_04_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_05_R", 1.0, -1, 8, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_01", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_02", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_03", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_04", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Guardiankung_Shining_05", 1.0, -1, 8, 8, posx, posy )
		end
		pMonster:PlaySound(991011)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function Guardian_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 89 ) then
		pMonster:AddDamage(DT_GUARDIANKUNG_ETERNALSWORD)
		pMonster:PlaySound(997016)

		local posx = -0.3
		local posy = 0.0
		local posx2 = 0.00
		local posy2 = 0.25
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Guardiankung_Scratch_R", 1.0, -1, 8, 8, posx, posy, true )			pMonster:AddTraceParticleToBone( "Guardiankung_Scratch_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_01_R", 1.0, -1, 8, 8, posx2, posy2, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_02_R", 1.0, -1, 8, 8, posx2, posy2, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_03_R", 1.0, -1, 8, 8, posx2, posy2, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_04_R", 1.0, -1, 8, 8, posx2, posy2, true )
		else
			pMonster:AddTraceParticleToBone( "Guardiankung_Scratch", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_01", 1.0, -1, 8, 8, -posx2, posy2 )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_02", 1.0, -1, 8, 8, -posx2, posy2 )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_03", 1.0, -1, 8, 8, -posx2, posy2 )
			pMonster:AddTraceParticleToBone( "Guardiankung_Puuk_04", 1.0, -1, 8, 8, -posx2, posy2 )
		end
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function Guardian_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 25 ) then
		pMonster:PlaySound(999041)
	elseif( iFrame == 35 ) then
		pMonster:PlaySound(999041)
	elseif( iFrame == 84 ) then
		pMonster:AddDamage(DT_GUARDIANKUNG_HEAVENSWORD)
		pMonster:PlaySound(998028)

		local posx = 0.0
		local posy = 0.35
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Guardiankung_Spin_01_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Guardiankung_Spin_02_R", 1.0, -1, 8, 8, posx, posy )
		else
			pMonster:AddTraceParticleToBone( "Guardiankung_Spin_01", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Guardiankung_Spin_02", 1.0, -1, 8, 8, posx, posy )
		end
	elseif( iFrame == 97 ) then
		pMonster:AddDamage(DT_GUARDIANKUNG_HEAVENSWORD)
		pMonster:PlaySound(998028)
	elseif( iFrame == 107 ) then
		pMonster:AddDamage(DT_GUARDIANKUNG_HEAVENSWORD)
		pMonster:PlaySound(998028)
	elseif( iFrame == 118 ) then
		pMonster:AddDamage(DT_GUARDIANKUNG_HEAVENSWORD_2)
		pMonster:PlaySound(997018)
		local posx = 0.7
		local posy = 0.2
		
		if ( false == pMonster:GetIsRight() ) then
			pMonster:AddTraceParticleToBone( "Guardiankung_Smash_01_R", 1.0, -1, 8, 8, -posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "Guardiankung_Smash_01", 1.0, -1, 8, 8, posx, posy )
		end
		
		pMonster:AddTraceParticleToBone( "Jin2_special3_Finisher_01", 1.0, -1, 8, 8, posx, posy )
		pMonster:AddTraceParticleToBone( "Jin2_special3_Finisher_02", 1.0, -1, 8, 8, posx, posy )
		pMonster:AddTraceParticleToBone( "Jin2_special3_Finisher_05", 1.0, -1, 8, 8, posx, posy )
		pMonster:AddTraceParticleToBone( "Jin2_special3_Finisher_06", 1.0, -1, 8, 8, posx, posy )
		pMonster:AddTraceParticleToBone( "Jin2_special3_Finisher_07", 1.0, -1, 8, 8, posx, posy )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Guardian_JumpFunc( iMonsterIndex, iFrame )
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

--  점프 다운 상태
function Guardian_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Guardian_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  스톤커스 걸렸음
function Guardian_StoneCurseFunc( iMonsterIndex, iFrame )
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

--  아이스커스 걸렸음
function Guardian_IceCurseFunc( iMonsterIndex, iFrame )
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


-- 홀드 걸렸음(이펙트)
function Guardian_HoldFunc( iMonsterIndex, iFrame )
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
-- 컨디션체크
-----------------------------------------------------------------------

function Guardian_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -500, 360, 500, -300 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function Guardian_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -700, 460, 700, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function Guardian_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Guardian_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 450, 300, -400 ) == false ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function Guardian_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 450, 300, -400 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Guardian_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Guardian_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 160, -160, 50, 160, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function Guardian_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 210, -210, 55, 210, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function Guardian_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 310, -260, 180, 260, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Guardian_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, 500, 300, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Guardian_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Guardian_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, -100, 200, -400 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGuardian_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnGuardian_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnGuardian_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.1 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK03" )
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
end

function Guardian_Jump( iMonsterIndex )
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

function Guardian_MoveFail( iMonsterIndex )
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
