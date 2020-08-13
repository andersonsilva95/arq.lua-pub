-- AI_Iblis.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Iblis_Wait.frm",
        Func    = "Iblis_WaitFunc",

        Trigger =
        {

			-- 타게팅
            {
                AICheckFrame        = 20,
                AIFunc              = "Iblis_Targeting",
                DelayFrame          = 80,
            },

            -- 타겟지움
            {
                AICheckFrame        = 150,
                AIFunc              = "Iblis_Check_ReleaseTarget",
                DelayFrame          = 250,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 30,
                AIFunc              = "Iblis_Check_TurnToTarget",
                DelayFrame          = 50,
            },

            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "Iblis_Check_Walk",
                DelayFrame          = 100,
            },

            -- 점프업
            {
                AICheckFrame        = 40,
                AIFunc              = "Iblis_Check_JumpUp",
                DelayFrame          = 30,
            },

            -- 점프다운
            {
                AICheckFrame        = 40,
                AIFunc              = "Iblis_Check_JumpDown",
                DelayFrame          = 10,
            },

			-- 레이저
            {
                AICheckFrame        = 200,
                AIFunc              = "Iblis_Check_Attack01",
                DelayFrame          = 400,
				DelayFrame1			= 200,
				DelayFrame2			= 20,
				DelayFrame3			= 20,
            },

            -- 저리가
            {
                AICheckFrame        = 21,
                AIFunc              = "Iblis_Check_Attack02",
                DelayFrame          = 299,
				DelayFrame1			= 199,
				DelayFrame2			= 99,
				DelayFrame3			= 99,
            },

            -- 기대
            {
                AICheckFrame        = 100,
                AIFunc              = "Iblis_Check_Attack03",
                DelayFrame          = 900,
				DelayFrame1			= 600,
				DelayFrame2			= 300,
				DelayFrame3			= 300,
            },

            -- 울기
            {
                AICheckFrame        = 100,
                AIFunc              = "Iblis_Check_Attack04",
                DelayFrame          = 666,
				DelayFrame1			= 333,
				DelayFrame2			= 33,
				DelayFrame3			= 33,
            },

            -- 소환
            {
                AICheckFrame        = 1024,
                AIFunc              = "Iblis_Check_Attack05",
                DelayFrame          = 1024,
            },

        },
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "Iblis_move.frm",
        Func            = "Iblis_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "Iblis_MoveFail",

        Trigger =
        {
            -- 걷기
            {
                AICheckFrame        = 50,
                AIFunc              = "Iblis_Check_Walk",
                DelayFrame          = 100,
            },

            -- 점프업
            {
                AICheckFrame        = 40,
                AIFunc              = "Iblis_Check_JumpUp",
                DelayFrame          = 30,
            },

            -- 점프다운
            {
                AICheckFrame        = 40,
                AIFunc              = "Iblis_Check_JumpDown",
                DelayFrame          = 10,
            },

            -- 저리가
            {
                AICheckFrame        = 21,
                AIFunc              = "Iblis_Check_Attack02",
                DelayFrame          = 99,
            },

            -- 멈추기
            {
                AICheckFrame        = 30,
                AIFunc              = "Iblis_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- 자매여 영원하라~
    {
        ID      = "ATTACK01",
        Motion  = "Iblis_Attack01.frm",
        Func    = "Iblis_Attack01Func",
    },
    
    -- 저리가
    {
        ID      = "ATTACK02",
        Motion  = "Iblis_Attack02.frm",
        Func    = "Iblis_Attack02Func",
    },
    
    -- 퓨리어스 컷
    {
        ID      = "ATTACK03",
        Motion  = "Iblis_Attack03.frm",
        Func    = "Iblis_Attack03Func",
    },
    
    -- 순칸이동
    {
        ID      = "ATTACK04",
        Motion  = "Iblis_Attack04.frm",
        Func    = "Iblis_Attack04Func",
    },
    
    -- 회복 토템
    {
        ID      = "ATTACK05",
        Motion  = "Iblis_Attack05.frm",
        Func    = "Iblis_Attack05Func",
    },
    
    -- Block
    {
        ID      = "BLOCK",
        Motion  = "Iblis_guard.frm",
        Func    = "Iblis_Attack06Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "Iblis_jump_up.frm",
        Func    = "Iblis_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "Iblis_jump_down.frm",
        Func    = "Iblis_JumpDownFunc",
    },

    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "Iblis_Jump_Landing.frm",
        Func    = "Iblis_ToWait",
    },

    -- 데미지 중
    {
        ID      = "DAMAGE",
        Motion  = "Iblis_damage.frm",
        Func    = "Iblis_DamageFunc",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Iblis_die.frm",
        Func    = "Iblis_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
    
    {
        ID      = "STUN",
        Motion  = "Iblis_Wait.frm",
        Func    = "Iblis_StunFunc",
	},
}

CallBack =
{
    Land    = "OnIblis_Land",
    Die     = "OnIblis_Die",
    Damage  = "OnIblis_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitIblis( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
    
    pMonster:RegisterSummonMonsterType( MON_DARK_TEMPLAR )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Iblis_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Iblis_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetRunSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function Iblis_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(995020)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 죽기 착지
function Iblis_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )

    if( iFrame <= 1 ) then
		pMonster:InitTimer()
		pMonster:StartTimer()
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:GetTimer() > 275 ) then
			pMonster:SetState( "WAIT" )
			pMonster:InitTimer()
		else
			pMonster:SetFrameLock( true )
		end
    end
end

-- 데미지 입은거
function Iblis_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Iblis_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격2 상태
function Iblis_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState("WAIT")
    end
end

--
function Iblis_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 33 ) then
		pMon:SetState("ATTACK03")
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
		pMon:SetState("WAIT")
    end
end

--
function Iblis_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 40 ) then
		pMon:SetState("ATTACK04")
		pMon:SetPlayerTargetManual( pMonster:GetPlayerTarget() )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Iblis_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local psummonMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 85 ) then
		local posy = 0.0
		pMonster:AddParticle("Iblis_Summon_01", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_02", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_03", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_04", 0.0, posy)
		pMonster:AddParticle("Iblis_Summon_05", 0.0, posy)
		pMonster:PlaySound(995019)
		local psummonMon = KSummonInfo()
        psummonMon:Init()
        psummonMon:SetState("SUMMON")
        psummonMon.iMonType = MON_DARK_TEMPLAR
    	psummonMon.fX = -350
    	psummonMon.fY = 0
		pMonster:SummonMonster( psummonMon )
		
		psummonMon = KSummonInfo()
        psummonMon:Init()
        psummonMon:SetState("SUMMON")
        psummonMon.iMonType = MON_DARK_TEMPLAR
    	psummonMon.fX = 350
    	psummonMon.fY = 0
		pMonster:SummonMonster( psummonMon )
		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

function Iblis_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )
    
    if( iFrame == 1 ) then
		pMonster:SetSuperArmor( true )
		pMon:SetState("BLOCK")
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster.DefRatio = 1.0
        pMonster:SetState( "WAIT" )
    end
end

--  점프 상태
function Iblis_JumpFunc( iMonsterIndex, iFrame )
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
function Iblis_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function Iblis_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Iblis_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -1600, 1000, 1600, -1000 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function Iblis_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--if( pMonster:CheckTargetInRange( 0, -800, 800, 800, -800 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	--end
end

function Iblis_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Iblis_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 1000, -500, 1000, 500, -1000 ) == true and pMonster:FloatRand() < 0.8) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
	end
end

function Iblis_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 1000, -500, 1000, 500, -1000 ) == false ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function Iblis_CheckDownUp02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:GetSpeedY() < 0.0 ) then
		pMonster:SetState( "DOWN_UP02" )
	end
end

function Iblis_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )

	if( pMonster:IsTarget() == true ) then
		pMonster:SetState( "ATTACK01" )
		pMon:SetState("ATTACK01")
		pMonster:ResetDelay()
	end
end

function Iblis_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    local pMon = g_MyD3D:GetMonster( 1 )

	if( pMonster:CheckTargetInRange( 100, -200, 200, 200, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMon:SetState("ATTACK02")
		pMonster:ResetDelay()
	end
end

function Iblis_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -250, 350, 250, -100 ) == true ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function Iblis_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 200, -250, 250, 250, -100 ) == false ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
	end
end

function Iblis_Check_Attack05( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetState( "ATTACK05" )
		pMonster:ResetDelay()
	end
end

function Iblis_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 100, -300, 800, 300, 150 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		Iblis_Jump( iMonsterIndex )
		pMonster:SetState( "JUMP" )
		pMonster:ResetDelay()
	end
end

function Iblis_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -300, -120, 300, -900 ) == true ) then
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

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnIblis_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function OnIblis_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pMon = g_MyD3D:GetMonster( 1 )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end

	pMonster:SetState( "DIE_LANDING" )
	pMon:SetState("DIE")
end

function OnIblis_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end
	
	if( pMonster:IsTarget() == true and pMonster:IsSuperArmor() == false ) then
		if( pMonster:FloatRand() < 0.1 ) then
			pMonster:SetSuperArmor( true )
			pMonster:TurnToTarget()
			if( pMonster:FloatRand() < 0.6 ) then
				pMonster:SetState( "ATTACK04" )
			else
				pMonster:SetState( "ATTACK01" )
			end
		end
	end
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false ) then
		if ( pMonster:FloatRand() < 0.25 and pMonster:GetIsContact() == true and pMonster:GetIsRight() ~= pMonster:GetTargetIsRight() ) then
			pMonster.DefRatio = 1000.0
			pMonster:SetState( "BLOCK" )
			pMonster:TurnToTarget()
		end
	end
end

function Iblis_Jump( iMonsterIndex )
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

function Iblis_MoveFail( iMonsterIndex )
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