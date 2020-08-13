-- AI_aron.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "aron_Wait.frm",
        Func    = "aron_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "aron_Check_Targeting",
                DelayFrame          = 50,
            },

            -- 타겟지움
            --{
            --	AICheckFrame        = 300,
            --	AIFunc              = "aron_Check_ReleaseTarget",
            --	DelayFrame          = 100,
            --},

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 20,
                AIFunc              = "aron_Check_TurnToTarget",
                DelayFrame          = 20,
            },

            -- 걷기 [75%]
            {
                AICheckFrame        = 110,
                AIFunc              = "aron_Check_Walk",
                DelayFrame          = 110,
            },

            -- 점프업 [80%]
            {
                AICheckFrame        = 91,
                AIFunc              = "aron_Check_JumpUp",
                DelayFrame          = 200,
				DelayFrame1         = 150,
				DelayFrame2         = 110,
				DelayFrame3         = 110,
            },

            -- 점프다운 [80%]
            {
                AICheckFrame        = 61,
                AIFunc              = "aron_Check_JumpDown",
                DelayFrame          = 110,
            },

			-- 디바인 퓨리
            {
                AICheckFrame        = 33,
                AIFunc              = "aron_Check_Attack01",
                DelayFrame          = 199,
				DelayFrame1         = 159,
				DelayFrame2         = 99,
				DelayFrame3         = 99,
            },

            -- 볼케닉 이럽션
            {
                AICheckFrame        = 55,
                AIFunc              = "aron_Check_Attack02",
                DelayFrame          = 220,
				DelayFrame1         = 165,
				DelayFrame2         = 110,
				DelayFrame3         = 110,
            },

            -- 썬더 해머 [50%]
            {
                AICheckFrame        = 220,
                AIFunc              = "aron_Check_Attack03",
				DelayFrame          = 440,
				DelayFrame1         = 330,
				DelayFrame2         = 220,
				DelayFrame3         = 220,
            },

			-- 로얄 가드 소환
            {
                AICheckFrame        = 550,
                AIFunc              = "aron_Check_Attack04",
				DelayFrame          = 2990,
				DelayFrame1         = 1990,
				DelayFrame2         = 990,
				DelayFrame3         = 990,
            },

		},
    },

    -- 이동
    {
        ID              = "WALK",
        Motion          = "aron_walk.frm",
        Func            = "aron_WalkFunc",
        EnableMoveCheck = TRUE,
        MoveFailFunc    = "aron_MoveFail",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 10,
                AIFunc              = "aron_Check_Targeting",
                DelayFrame          = 40,
            },

			-- 타겟을 향해 턴
            {
                AICheckFrame        = 10,
                AIFunc              = "aron_Check_TurnToTarget",
                DelayFrame          = 10,
            },
            -- 점프업
            {
                AICheckFrame        = 41,
                AIFunc              = "aron_Check_JumpUp",
                DelayFrame          = 40,
            },        
            -- 점프다운
            {
                AICheckFrame        = 21,
                AIFunc              = "aron_Check_JumpDown",
                DelayFrame          = 20,
            },
            -- 멈추기
            {
                AICheckFrame        = 5,
                AIFunc              = "aron_Check_Stop",
                DelayFrame          = 50,
            },
        }
    },
        
    -- 
    {
        ID      = "DRAMA_WAIT",
        Motion  = "aron_Wait.frm",
        Func    = "aron_DramaWaitFunc",
    },
    
    -- 근접공격2
    {
        ID      = "ATTACK01",
        Motion  = "aron_Attack02.frm",
        Func    = "aron_Attack01Func",
    },
    
    -- 근접공격3
    {
        ID      = "ATTACK02",
        Motion  = "aron_Attack03.frm",
        Func    = "aron_Attack02Func",
    },
    
    -- 근접공격4
    {
        ID      = "ATTACK03",
        Motion  = "aron_Attack04.frm",
        Func    = "aron_Attack03Func",
    },
    
    -- 근접공격5
    {
        ID      = "ATTACK04",
        Motion  = "aron_Attack05.frm",
        Func    = "aron_Attack04Func",
    },
    
    -- 점프
    {
        ID      = "JUMP",
        Motion  = "aron_Jump_Up.frm",
        Func    = "aron_JumpFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_FAKE",
        Motion  = "aron_Jump_Up.frm",
        Func    = "aron_JumpFakeFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_DOWN",
        Motion  = "aron_Jump_Down.frm",
        Func    = "aron_JumpDownFunc",
    },
    
    -- 점프
    {
        ID      = "JUMP_LANDING",
        Motion  = "aron_Jump_Landing.frm",
        Func    = "aron_ToWait",
    },

    -- 죽기 착지
    {
        ID      = "DIE_LANDING",
        Motion  = "aron_Die.frm",
        Func    = "aron_DieLandingFunc",
        IsFallDownMotion    = TRUE,
    },
}

CallBack =
{
    Land    = "Onaron_Land",
    Die     = "Onaron_Die",
    Damage  = "Onaron_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function Initaron( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	pMonster:RegisterSummonMonsterType( MON_THUNDER_HAMMER_ROYALGUARD )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function aron_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 대기 상태
function aron_DramaWaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame == 3 ) then
		pMonster:SetIsRight(false)
		pMonster:SetMovement(false)
		pMonster:SetInvincible( true )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DRAMA_WAIT" )
    end
end

-- 걷기 상태
function aron_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽기 착지
function aron_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 2 ) then
		pMonster:PlaySound(987001)
	elseif( iFrame == pMonster:GetLastFrame() - 1 ) then
		if( pMonster:GetSpecialType() == OPT_GATE ) then
			pMonster:EndMonster()
		end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster(true)
        pMonster:SetFrameLock( true )
		pMonster:SetState( "DRAMA_WAIT" )
    end
end

-- 데미지 입은거
function aron_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function aron_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 62 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_ARON_ATK1)
		pMonster:PlaySound(997003)
	elseif( iFrame == 65 ) then
		local posx = 0.45
		local posy = 0.3
		local posx2 = 0.0
		local posy2 = 0.0
		
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticle( "Aron_Devine_01", posx, posy )
			pMonster:AddParticle( "Aron_Devine_02", posx, posy )
			pMonster:AddParticle( "Aron_Devine_03", posx, posy )
			pMonster:AddParticle( "Aron_Devine_04", posx, posy )
			pMonster:AddParticle( "Aron_Devine_05", posx, posy )
			pMonster:AddParticle( "SK_Scratch_R", posx2, posy2 )
		else
			posx = posx * -1.0
			pMonster:AddParticleNoDirection( "Aron_Devine_01_R", posx, posy )
			pMonster:AddParticleNoDirection( "Aron_Devine_02_R", posx, posy )
			pMonster:AddParticleNoDirection( "Aron_Devine_03"  , posx, posy )
			pMonster:AddParticleNoDirection( "Aron_Devine_04"  , posx, posy )
			pMonster:AddParticleNoDirection( "Aron_Devine_05"  , posx, posy )
			pMonster:AddParticleNoDirection( "SK_Scratch" , posx2, posy2 )
		end

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end

end

--  근접공격2 상태
function aron_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
    elseif( iFrame == 60 ) then
		pMonster:AddDamageWithLocate(DT_THUNDER_HAMMER_ARON_ATK2, 0.3, 0.3)
		pMonster:AddDamageWithLocate(DT_THUNDER_HAMMER_ARON_ATK2_R, -0.3, 0.3)

    elseif( iFrame == 80 ) then
		pMonster:AddDamageWithLocate(DT_THUNDER_HAMMER_ARON_ATK2, 0.6, 0.3)
		pMonster:AddDamageWithLocate(DT_THUNDER_HAMMER_ARON_ATK2_R, -0.6, 0.3)

    elseif( iFrame == 100 ) then
		pMonster:AddDamageWithLocate(DT_THUNDER_HAMMER_ARON_ATK2, 0.9, 0.3)
		pMonster:AddDamageWithLocate(DT_THUNDER_HAMMER_ARON_ATK2_R, -0.9, 0.3)

    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function aron_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 41 ) then
		pMonster:PlaySound(987004)
		local posy = 1.0
		if( pMonster:GetIsRight() == false ) then
			pMonster:AddParticleNoDirection("Aron_Thunder_Charge_01", 0.11, 0.98)
			pMonster:AddParticleNoDirection("Aron_Thunder_Charge_02", 0.11, 0.98)
		else
			pMonster:AddParticleNoDirection("Aron_Thunder_Charge_01", -0.05, posy)
			pMonster:AddParticleNoDirection("Aron_Thunder_Charge_02", -0.05, posy)
		end 

	elseif( iFrame == 68 ) then
		pMonster:SkillReadyEffect(255, 255, 128, 0.75)

	elseif( iFrame == 76 ) then
		if( pMonster:GetIsRight() ) then
			pMonster:AddDamageToAlivePlayer( DT_THUNDER_HAMMER_ARON_ATK3, 0.0, 0.0 )
		else
			pMonster:AddDamageToAlivePlayer( DT_THUNDER_HAMMER_ARON_ATK3_R, 0.0, 0.0 )
		end

	elseif( iFrame == 86 ) then
		pMonster:PlaySound(995003)
		pMonster:AddDamage(DT_THUNDER_HAMMER_ARON_ATK3_PHY)

	elseif( iFrame == 90 ) then
		local posx = 0.57
		local posy = -0.05
		if( pMonster:GetIsRight() == false ) then
			posx = posx * -1.0
		end
		
		pMonster:AddParticleNoDirection( "Aron_Hammer_01", posx, posy )
		pMonster:AddParticleNoDirection( "Aron_Hammer_03", posx, posy )
		pMonster:AddParticleNoDirection( "Aron_Hammer_04", posx, posy )
		pMonster:AddParticleNoDirection( "Overseer_Smash_01", posx, posy )
		pMonster:AddParticleNoDirection( "Overseer_Smash_02", posx, posy )
		pMonster:AddParticleNoDirection( "Overseer_Spin_02", posx, posy )
	elseif( iFrame == 94 ) then
		pMonster:CameraVib( 1, 1.0, 0.02 )
	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  
function aron_Attack04Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( 0.0 )
	if( iFrame == 44 ) then
		pMonster:AddParticle("Periot_Magiccircle_01", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_02", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_03", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_04", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_05", 0.0, 0.0)
		pMonster:AddParticle("Periot_Magiccircle_06", 0.0, 0.0)
	elseif( iFrame == 50 ) then
		pMonster:PlaySound(987006)
		local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_THUNDER_HAMMER_ROYALGUARD
        pMon.fX = -300
        pMon.fY = 0
        pMonster:SummonMonster( pMon )
        
        local pMon = KSummonInfo()
        pMon:Init()
        pMon:SetState("SUMMON")
        pMon.iMonType = MON_THUNDER_HAMMER_ROYALGUARD
        pMon.fX = 300
        pMon.fY = 0
        pMonster:SummonMonster( pMon )

		pMonster:CameraVib( 0.1, 0.5, 0.02 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
	end
end

--  점프 상태
function aron_JumpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 8 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame == 8 ) then
		aron_Jump( iMonsterIndex )
		local posy = 0.0
		local posx = 0.0
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function aron_JumpFakeFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame > 8 and pMonster:GetSpeedY() <= 0.0 ) then
		pMonster:SetState("JUMP_DOWN")
		pMonster:SetFrameLock( false )
	end
	
	if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 다운 상태
function aron_JumpDownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )
	elseif( iFrame == 2 ) then
		local posy = 0.0
		local posx = 0.0
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

--  점프 상태
function aron_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
		pMonster:AddDamage(DT_THUNDER_HAMMER_ARON_JUMP_ATK)
		local posx = 0.05
		local posy = 0.0
		
		if(pMonster:GetIsRight() == false) then
			posx = posx * -1.0
		end
		
		pMonster:AddParticleNoDirection( "Elderkung_Down_01", posx, posy )
		pMonster:AddParticleNoDirection( "Elderkung_Down_02", posx, posy )
		pMonster:AddParticleNoDirection( "Elderkung_Down_03", posx, posy )
		pMonster:AddParticleNoDirection( "Aron_Jump", posx, posy )
		pMonster:PlaySound(991019)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end
-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function aron_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1666, 888, 1666, -888 ) == true ) then
		pMonster:TurnToTarget()
        pMonster:ResetDelay()
    end  
end

function aron_Check_ReleaseTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 100, -800, 460, 800, -400 ) == false ) then
		pMonster:ReleaseTarget()
		pMonster:ResetDelay()
	end
end

function aron_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function aron_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		if( pMonster:CheckTargetInRange( 0, -300, 800, 300, -800 ) == false and pMonster:FloatRand() < 0.75 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "WALK" )
			pMonster:ResetDelay()
		end
	end
end

function aron_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -300, 800, 300, -800 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function aron_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 150, -150, 200, 150, -100 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
	end
end

function aron_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 0, -280, 200, 280, -100 ) == true ) then
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
	end
end

function aron_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:FloatRand() < 0.5 ) then
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
	end
end

function aron_Check_Attack04( iMonsterIndex, iFrame )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )	

	if( pMonster:GetSummonedMonsterCount() < 2 ) then
		pMonster:SetState( "ATTACK04" )
		pMonster:ResetDelay()
    end
end

function aron_Check_JumpUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 200, -200, 800, 200, 70 ) == true and pMonster:GetIsContact() == true and pMonster:GetTargetIsContact() == true ) then
		if ( pMonster:FloatRand() < 0.8 ) then
			pMonster:SetState( "JUMP" )
			pMonster:ResetDelay()
		end
	end
end

function aron_Check_JumpDown( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

	if( pMonster:CheckTargetInRange( 300, -300, -100, 300, -800 ) == true ) then
		if ( pMonster:FloatRand() < 0.8 ) then
			pMonster:SetNoCheckContact(30)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP_DOWN" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:SetSpeedY( 0.01 )	
			pMonster:ResetDelay()
		end
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function Onaron_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
	
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "JUMP_DOWN" ) == true ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "JUMP_LANDING" )
    end   
end

function Onaron_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:TurnToTarget()
	
	if( pMonster:GetIsRight() == true ) then
		pMonster:SetSpeedX( -0.02 )
	else
		pMonster:SetSpeedX( 0.02 )
	end
	
	pMonster:SetState( "DIE_LANDING" )
end

function Onaron_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:IsSuperArmor() == false and pMonster:CheckState( "ATTACK01" ) == false and pMonster:CheckState( "ATTACK02" ) == false and pMonster:CheckState( "ATTACK03" ) == false and pMonster:CheckState( "STONECURSE" ) == false and pMonster:CheckState( "ICECURSE" ) == false  and pMonster:CheckState( "HOLD" ) == false ) then
		if ( pMonster:FloatRand() < 0.05 and pMonster:GetIsContact() == true ) then
			pMonster:TurnToTarget()
			if( pMonster:CheckTargetInRange( 200, -200, 200, 200, -100 ) == true ) then
				pMonster:SetState( "ATTACK01" )
			else
				pMonster:SetState( "ATTACK02" )
			end
		end
	end

    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 3.0 ) / 10.0 )
    pMonster:SetSpeedY( 0 )
    
	if( pMonster:CheckState( "JUMP" ) == true and pMonster:IsSuperArmor() == false ) then
		pMonster:SetNoCheckContact( 5 )
	end

	if( pMonster:IsSuperArmor() == false ) then
		if ( pMonster:FloatRand() < 0.04 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "ATTACK03" )
		end
	end
end

function aron_Jump( iMonsterIndex )
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

function aron_MoveFail( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:GetIsContact() == true )then		
		if( pMonster:GetY() - (0.06) < pMonster:GetTargetY() )then			
			pMonster:SetNoCheckContact(27)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP_FAKE" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:TurnToTarget()
			pMonster:SetSpeedY( 0.025 )
		else
			pMonster:SetNoCheckContact(15)
			pMonster:SetIgnoreFHCheck(true)
			pMonster:SetState( "JUMP_FAKE" )
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 1.2 )
			pMonster:TurnToTarget()
			pMonster:SetSpeedY( 0.019 )		
		end
	end
end
