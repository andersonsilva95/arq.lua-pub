-- AI_ElderKungi.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "ElderKungi_Wait.frm",
        Func    = "ElderKungi_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "ElderKungi_Check_Targeting",
                DelayFrame          = 40,
            },

            -- 타겟지움
            --{
            --    AICheckFrame        = 150,
            --    AIFunc              = "ElderKungi_Check_ReleaseTarget",
            --    DelayFrame          = 100,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "ElderKungi_Check_TurnToTarget",
                DelayFrame          = 25,
            },

            -- 걷기
            {
                AICheckFrame        = 140,
                AIFunc              = "ElderKungi_Check_Walk",
                DelayFrame          = 140,
            },

            -- 점프업
            {
                AICheckFrame        = 62,
                AIFunc              = "ElderKungi_Check_JumpUp",
                DelayFrame          = 60,
            },        

            -- 점프다운
            {
                AICheckFrame        = 51,
                AIFunc              = "ElderKungi_Check_JumpDown",
                DelayFrame          = 40,
            },

			-- 허리케인
            {
                AICheckFrame        = 20,
                AIFunc              = "ElderKungi_Check_Attack01",
                DelayFrame          = 120,
            },

            -- 쿵 샷
            {
                AICheckFrame        = 13,
                AIFunc              = "ElderKungi_Check_Attack02",
                DelayFrame          = 150,
            },

            -- 플라잉 힙 다운 [75%]
            {
                AICheckFrame        = 150,
                AIFunc              = "ElderKungi_Check_Attack03",
                DelayFrame          = 200,
            },

			-- 리프 토네이도 [75%]
            {
                AICheckFrame        = 220,
                AIFunc              = "ElderKungi_Check_Attack04",
                DelayFrame          = 220,
            },
            
			-- 소환
            {
                AICheckFrame        = 256,
                AIFunc              = "ElderKungi_Check_Summon",
                DelayFrame          = 600,
            },
        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "ElderKungi_walk.frm",
        Func            = "ElderKungi_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "ElderKungi_MoveFail",


        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 30,
                AIFunc              = "ElderKungi_Check_Targeting",
                DelayFrame          = 30,
            },
            -- 타겟지움
            --{
            --    AICheckFrame        = 220,
            --    AIFunc              = "ElderKungi_Check_ReleaseTarget",
            --    DelayFrame          = 440,
            --},
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 15,
                AIFunc              = "ElderKungi_Check_TurnToTarget",
                DelayFrame          = 20,
            },
            -- 점프업
            {
                AICheckFrame        = 32,
                AIFunc              = "ElderKungi_Check_JumpUp",
                DelayFrame          = 40,
            },
            -- 점프다운
            {
                AICheckFrame        = 31,
                AIFunc              = "ElderKungi_Check_JumpDown",
                DelayFrame          = 30,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "ElderKungi_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- 근접공격
    {
        ID      = "ATTACK01",
        Motion  = "ElderKungi_Attack01.frm",
        Func    = "ElderKungi_Attack01Func",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK02",
        Motion  = "ElderKungi_Attack02.frm",
        Func    = "ElderKungi_Attack02Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03",
        Motion  = "ElderKungi_Attack03_A.frm",
        Func    = "ElderKungi_Attack03_UpFunc",

        Trigger =
        {
            -- 내려오기~
            {
                AICheckFrame        = 1,
                AIFunc              = "ElderKungi_Check_Attack03_Down",
                DelayFrame          = 1,
            },
        }

    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03_DOWN",
        Motion  = "ElderKungi_Attack03_B.frm",
        Func    = "ElderKungi_Attack03_DownFunc",
        
        Trigger =
        {
            -- 촥지~
            {
                AICheckFrame        = 1,
                AIFunc              = "ElderKungi_Check_Attack03_Landing",
                DelayFrame          = 1,
            },
        }
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK03_LANDING",
        Motion  = "ElderKungi_Attack03_C.frm",
        Func    = "ElderKungi_Attack03_LandingFunc",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK04",
        Motion  = "Elderkung_Attack04.frm",
        Func    = "ElderKungi_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "ElderKungi_Jump_Up.frm",
        Func    = "ElderKungi_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "ElderKungi_Jump_Down.frm",
        Func    = "ElderKungi_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "ElderKungi_Jump_Landing.frm",
        Func    = "ElderKungi_ToWait",
    },

    -- 데미지 상
    {
        ID      = "DAMAGE_UP",
        Motion  = "ElderKungi_Damage_Up.frm",
        Func    = "ElderKungi_DamageFunc",
    },
    
    -- 데미지 중
    {
        ID      = "DAMAGE_MIDDLE",
        Motion  = "ElderKungi_Damage_Middle.frm",
        Func    = "ElderKungi_DamageFunc",
    },
    
    -- 데미지 하
    {
        ID      = "DAMAGE_DOWN",
        Motion  = "ElderKungi_Damage_Down.frm",
        Func    = "ElderKungi_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "ElderKungi_Die.frm",
        Func    = "ElderKungi_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    -- 죽기 착지
    {
        ID      = "DIE_LOOP",
        Motion  = "ElderKungi_Die_B.frm",
        Func    = "ElderKungi_DieLoopFunc",
    },
    
    -- 소환
    {
        ID      = "SUMMON",
        Motion  = "ElderKungi_Summon.frm",
        Func    = "ElderKungi_SummonFunc",
    },
}

CallBack =
{
    Land    = "OnElderKungi_Land",
    Die     = "OnElderKungi_Die",
    Damage  = "OnElderKungi_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitElderKungi( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE_UP" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE_MIDDLE" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE_DOWN" )
    --pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE_DOWN" )
    
    pMonster:RegisterSummonMonsterType( MON_KUNGJI_BIG )
    pMonster:RegisterSummonMonsterType( MON_KUNGJI_MAGIC )
    
    pMonster:SetCountValue(0)
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function ElderKungi_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function ElderKungi_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function ElderKungi_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(991015)
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		if( pMonster:GetSpecialType() == OPT_GATE ) then
			pMonster:EndMonster()
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetState( "DIE_LOOP" )
    end
end

-- 죽기 착지
function ElderKungi_DieLoopFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DIE_LOOP" )
    end
end

-- 서먼
function ElderKungi_SummonFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )

	elseif( iFrame == 10 ) then
		pMonster:AddParticle("Setesh_Summon_01", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_02", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_03", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_04", 0.0, posy)
		pMonster:AddParticle("Setesh_Summon_05", 0.0, posy)

	elseif( iFrame == 60 ) then
		local posy = 0.0
		
		pMonster:PlaySound(994020)

		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_KUNGJI_MAGIC
    	pMon.fX = -300
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
		pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("WAIT")
        pMon.iMonType = MON_KUNGJI_BIG
    	pMon.fX = 300
    	pMon.fY = 0
		pMonster:SummonMonster( pMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 데미지 입은거
function ElderKungi_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function ElderKungi_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
		pMonster:AddDamage(DT_ELDERKUNG_HURRICANE)
    elseif( iFrame == 48 ) then
		pMonster:PlaySound(991016)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function ElderKungi_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 53 ) then
		pMonster:AddDamage( DT_ELDERKUNG_KUNGSHOT )
	elseif( iFrame == 56 ) then
		local posx = 0.4
		local posy = 0.37
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_01", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_02_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_03", 1.0, -1, 8, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_01", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_02", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_03", 1.0, -1, 8, 8, posx, posy )
		end
		pMonster:PlaySound(991017)
	elseif( iFrame == 73 ) then
		pMonster:AddDamage( DT_ELDERKUNG_KUNGSHOT_2 )
	elseif( iFrame == 76 ) then
		local posx = 0.4
		local posy = 0.37
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_01_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_02_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_03", 1.0, -1, 8, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_01", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_02", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_03", 1.0, -1, 8, 8, posx, posy )
		end
		pMonster:PlaySound(991017)
	elseif( iFrame == 93 ) then
		pMonster:AddDamage( DT_ELDERKUNG_KUNGSHOT_3 )
	elseif( iFrame == 96 ) then
		local posx = 0.4
		local posy = 0.37
		if ( false == pMonster:GetIsRight() ) then
			posx = posx * -1.0
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_01_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_02_R", 1.0, -1, 8, 8, posx, posy, true )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_03", 1.0, -1, 8, 8, posx, posy, true )
		else
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_01", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_02", 1.0, -1, 8, 8, posx, posy )
			pMonster:AddTraceParticleToBone( "Elderkung_Ball_Shot_03", 1.0, -1, 8, 8, posx, posy )
		end
		pMonster:PlaySound(991017)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function ElderKungi_Attack03_UpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    local fTargetX
    local fTargetY
    
    if( iFrame == 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:StartText( "DANGER" )
	elseif( iFrame == 30 ) then
		pMonster:PlaySound(991018)
		local fTargetX = pMonster:GetTargetX()
		local fTargetY = pMonster:GetTargetY()

		local fMonX = pMonster:GetX()
		local fMonY = pMonster:GetY()

		local gapY
		-- 몬스터가 위에 있네
		if ( fMonY > fTargetY ) then
			gapY = (fMonY - fTargetY) * 0.01 + (0.0015 * 15)
		-- 몬스터가 아래에 있네
		else
			gapY = ((fTargetY - fMonY) * 0.01) + (0.0015 * (30 + pMonster:FloatAbs(fTargetY - fMonY) * 9) )
		end

		fSpeedX = ( fTargetX - fMonX ) * 1.5
		fSpeedY = gapY
		
		print((fSpeedY * 200.0))
		pMonster:SetNoCheckContact(52 + (fSpeedY * 200.0))
		pMonster:TurnToTarget()
		pMonster:SetSpeedX( fSpeedX * 0.01 )
		pMonster:SetSpeedY( fSpeedY )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock(true)
    end
end

function ElderKungi_Attack03_DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetFly(false)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedY( -0.065 )
        pMonster:SetFrameLock(true)
    end
end

function ElderKungi_Attack03_LandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
		pMonster:SetSpeedX( 0 )

		local posx = 0.0
		local posy = 0.0
		pMonster:AddTraceParticleToBone( "Elderkung_Down_01", 1.0, -1, 8, 8, posx, posy )
		pMonster:AddTraceParticleToBone( "Elderkung_Down_02", 1.0, -1, 8, 8, posx, posy )
		pMonster:AddTraceParticleToBone( "Elderkung_Down_03", 1.0, -1, 8, 8, posx, posy )
		pMonster:AddTraceParticleToBone( "Elderkung_Down_04", 1.0, -1, 8, 8, posx, posy )

		pMonster:EarthQuake( 30, 0.06, 0.02 )
		--pMonster:AddDamage(DT_ELDERKUNG_FLYINGHIPDOWN)
		--pMonster:AddDamage(DT_ELDERKUNG_FLYINGHIPDOWN_2)

	elseif( iFrame == 3 ) then
		pMonster:CameraVib( 1, 1.0, 0.02 )
		pMonster:PlaySound(991019)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  근접공격2 상태
function ElderKungi_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 38 ) then
		pMonster:PlaySound(458)
	elseif( iFrame == 53 ) then
		pMonster:AddDamage( DT_ELDERKUNGI_ATTACK04_L )
		--pMonster:AddDamage( DT_ELDERKUNGI_ATTACK04_R )
	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


--  점프 상태
function ElderKungi_JumpFunc( iMonsterIndex, iFrame )
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
function ElderKungi_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
        if( pMonster:GetIsContactByPos() and pMonster:GetSpeedY() < 0 ) then
			pMonster:SetState( "JUMP_LANDING" )
		end
    end
end

--  점프 상태
function ElderKungi_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function ElderKungi_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1666, 999, 1666, -999 ) == true ) then
		pMonster:TurnToTarget()
		
        pMonster:ResetDelay()
    end  
end

function ElderKungi_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 200, -800, 500, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -350, 600, 350, -600 ) == false and pMonster:FloatRand() < 0.75 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function ElderKungi_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -350, 600, 350, -600 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function ElderKungi_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function ElderKungi_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 500, -300, 400, 300, -120 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:IsTarget() == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:IsTarget() == true and pMonster:FloatRand() < 0.75 ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_Summon( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSummonedMonsterCount() < 2 ) then
        pMonster:SetState( "SUMMON" )
        pMonster:ResetDelay()
    end
end

function ElderKungi_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 250, -250, 800, 250, 100 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		ElderKungi_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -800 ) == true ) then
		pMonster:SetNoCheckContact(30)
		pMonster:SetIgnoreFHCheck(true)
		pMonster:SetState( "JUMP_DOWN" )
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
		pMonster:SetSpeedY( 0.01 )	
		pMonster:ResetDelay()
	end
end

function ElderKungi_Check_Attack03_Down( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "ATTACK03_DOWN" )
	end
end

function ElderKungi_Check_Attack03_Landing( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetIsContact() == true ) then
		pMonster:SetState( "ATTACK03_LANDING" )
	end
end
-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnElderKungi_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnElderKungi_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
end

function OnElderKungi_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 ) then
			pMonster:TurnToTarget()
			if ( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK03" )
			else
				pMonster:SetState( "ATTACK04" )
			end
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
--[[ 위에 있는 반격은 모지..
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false ) then
		if ( pMonster:FloatRand() < 0.12 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster:SetState( "ATTACK03" )
		end
	end
--]]
end

function ElderKungi_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 4.0)) + (((fTargetY - fMonY) * 1.5) + pMonster:FloatAbs((fSpeedX / 3.1)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.9))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end

function ElderKungi_MoveFail( iMonsterIndex )
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