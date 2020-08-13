-- AI_Thanatos2.lua

ActionList =
{	
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "Thanatos2_Wait.frm",
        Func    = "Thanatos2_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "Thanatos2_Check_Targeting",
                DelayFrame          = 10,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 11,
                AIFunc              = "Thanatos2_Check_TurnToTarget",
                DelayFrame          = 19,
            },

            -- 위로이동
            {
                AICheckFrame        = 150,
                AIFunc              = "Thanatos2_Check_MoveUp",
                DelayFrame          = 200,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 55,
                AIFunc              = "Thanatos2_Check_MoveDownLeft",
                DelayFrame          = 100,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 55,
                AIFunc              = "Thanatos2_Check_MoveDownRight",
                DelayFrame          = 100,
            },

            -- 고스트 프레임
            {
                AICheckFrame        = 44,
                AIFunc              = "Thanatos2_Check_Attack01",
                DelayFrame          = 600,
				DelayFrame1         = 400,
				DelayFrame2         = 200,
				DelayFrame3         = 200,
            },

            -- 다크 스피어
            {
                AICheckFrame        = 100,
                AIFunc              = "Thanatos2_Check_Attack02",
                DelayFrame          = 300,
				DelayFrame1         = 200,
				DelayFrame2         = 100,
				DelayFrame3         = 100,
            },

            -- 죽음의 영혼
            {
                AICheckFrame        = 600,
                AIFunc              = "Thanatos2_Check_Attack03",
                DelayFrame          = 198,
				DelayFrame1         = 132,
				DelayFrame2         = 66,
				DelayFrame3         = 66,
            },

            -- 석화 브레스
            {
                AICheckFrame        = 300,
                AIFunc              = "Thanatos2_Check_Attack04",
                DelayFrame          = 150,
				DelayFrame1         = 100,
				DelayFrame2         = 50,
				DelayFrame3         = 50,
            },

        },
    },

    -- 위로이동
    {
        ID      = "MOVE_UP",
        Motion  = "Thanatos2_move_up.frm",
        Func    = "Thanatos2_MoveUpFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "Thanatos2_Check_Targeting",
                DelayFrame          = 10,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 11,
                AIFunc              = "Thanatos2_Check_TurnToTarget",
                DelayFrame          = 19,
            },

            -- 아래로이동 좌
            {
                AICheckFrame        = 90,
                AIFunc              = "Thanatos2_Check_MoveDownLeft",
                DelayFrame          = 45,
            },
            -- 아래로이동 우
            {
                AICheckFrame        = 90,
                AIFunc              = "Thanatos2_Check_MoveDownRight",
                DelayFrame          = 45,
            },

			-- 멈추기
            {
                AICheckFrame        = 110,
                AIFunc              = "Thanatos2_Check_Stop",
                DelayFrame          = 90,
            },
        }
    },
    
    -- 아래로이동 좌
    {
        ID      = "MOVE_DOWN_LEFT",
        Motion  = "Thanatos2_move_down.frm",
        Func    = "Thanatos2_MoveDownLeftFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "Thanatos2_Check_Targeting",
                DelayFrame          = 10,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 11,
                AIFunc              = "Thanatos2_Check_TurnToTarget",
                DelayFrame          = 19,
            },

            -- 위로이동
            {
                AICheckFrame        = 60,
                AIFunc              = "Thanatos2_Check_MoveUp",
                DelayFrame          = 100,
            },

            -- 아래로이동 우
            {
                AICheckFrame        = 40,
                AIFunc              = "Thanatos2_Check_MoveDownRight",
                DelayFrame          = 100,
            },

			-- 멈추기
            {
                AICheckFrame        = 110,
                AIFunc              = "Thanatos2_Check_Stop",
                DelayFrame          = 90,
            },
        }
    },
    
     -- 아래로이동 우
    {
        ID      = "MOVE_DOWN_RIGHT",
        Motion  = "Thanatos2_move_down.frm",
        Func    = "Thanatos2_MoveDownRightFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 10,
                AIFunc              = "Thanatos2_Check_Targeting",
                DelayFrame          = 10,
            },

            -- 타겟을 향해 턴
            {
                AICheckFrame        = 11,
                AIFunc              = "Thanatos2_Check_TurnToTarget",
                DelayFrame          = 19,
            },

            -- 위로이동
            {
                AICheckFrame        = 60,
                AIFunc              = "Thanatos2_Check_MoveUp",
                DelayFrame          = 100,
            },
            -- 아래로이동 좌
            {
                AICheckFrame        = 40,
                AIFunc              = "Thanatos2_Check_MoveDownLeft",
                DelayFrame          = 100,
            },

			-- 멈추기
            {
                AICheckFrame        = 110,
                AIFunc              = "Thanatos2_Check_Stop",
                DelayFrame          = 90,
            },
        }
    },

    -- 가만히있기
    {
        ID      = "IDLE",
        Motion  = "Thanatos2_Wait.frm",
        Func    = "Thanatos2_IdleFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 45,
                AIFunc              = "Thanatos2_Check_Targeting",
                DelayFrame          = 110,
            },
        }
    },

    -- 근접공격01
    {
        ID      = "ATTACK01",
        Motion  = "Thanatos2_Attack01.frm",
        Func    = "Thanatos2_Attack01Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK02",
        Motion  = "Thanatos2_Attack02.frm",
        Func    = "Thanatos2_Attack02Func",
    },
    
    -- 깃털공격02
    {
        ID      = "ATTACK03",
        Motion  = "Thanatos2_Attack03.frm",
        Func    = "Thanatos2_Attack03Func",
    },
    
    -- 
    {
        ID      = "ATTACK04_RR",
        Motion  = "Thanatos2_attack04_left_back.frm",
        Func    = "Thanatos2_Attack04RFunc",
    },
    
    -- 
    {
        ID      = "ATTACK04_RL",
        Motion  = "Thanatos2_attack04_right_back.frm",
        Func    = "Thanatos2_Attack04LFunc",
    },
    
    -- 
    {
        ID      = "ATTACK04_LR",
        Motion  = "Thanatos2_attack04_left.frm",
        Func    = "Thanatos2_Attack04LFunc",
    },
    
    -- 
    {
        ID      = "ATTACK04_LL",
        Motion  = "Thanatos2_attack04_right.frm",
        Func    = "Thanatos2_Attack04RFunc",
    },
    
    -- 죽기착지
    {
        ID      = "DIE_LANDING",
        Motion  = "Thanatos2_change.frm",
        Func    = "Thanatos2_DieLandingFunc",
    },
    
    {
        ID      = "STUN",
        Motion  = "Thanatos2_Wait.frm",
        Func    = "Thanatos2_StunFunc",
    },
}

CallBack =
{
    Land    = "OnThanatos2_Land",
    --Die     = "OnThanatos2_Die",
    Damage  = "OnThanatos2_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitThanatos2( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetFly( true )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Thanatos2_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
end

-- 대기 상태
function Thanatos2_StunFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

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

-- 위로날기 상태
function Thanatos2_MoveUpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	pMonster:SetSpeedY( 0.006 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
        --pMonster:SetState( "MOVE_UP" )
    end
end

-- 아래로날기 좌 상태
function Thanatos2_MoveDownLeftFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( -0.008 )
	pMonster:SetSpeedY( -0.003 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
        --pMonster:SetState( "MOVE_DOWN_LEFT" )
    end
end

-- 아래로날기 우 상태
function Thanatos2_MoveDownRightFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	--pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
	pMonster:SetSpeedX( 0.008 )
	pMonster:SetSpeedY( -0.003 )
	
	if( iFrame <= 1 ) then
		pMonster:SetNoCheckContact(550)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetFrameLock( true )
        --pMonster:SetState( "MOVE_DOWN_RIGHT" )
    end
end

-- 가만히있기 상태
function Thanatos2_IdleFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
        
	if( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
        pMonster:SetState( "IDLE" )
    end
end

-- 죽기상태
function Thanatos2_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound( 995041 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetFrameLock( true )
    end
end

-- 죽기착지상태
function Thanatos2_DieLandingFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 60 ) then
		pMonster:AddParticleNoDirection( "Victor_Res_01", 0.0, 0.7)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 데미지 입은거
function Thanatos2_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetSpeedX( pMonster:GetSpeedX() * 19.0 / 20.0 )
	pMonster:SetSpeedY( pMonster:GetSpeedY() * 19.0 / 20.0 )
	
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  근접공격 상태
function Thanatos2_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 45 ) then
		pMonster:PlaySound(995005)
		pMonster:AddDamage(DT_THANATOS2_GHOSTFRAME)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  깃털공격 02 상태
function Thanatos2_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	local posx = 0.1 
    local posy = 0.7 
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 70 ) then
        local bonePos = pMonster:GetBonePos(39)
        pMonster:AddDamageWithLocate(DT_THANATOS2_DARKSPEAR_SHOOTER, bonePos.x, bonePos.y, true)
	elseif( iFrame == 75 ) then
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_01", posx, posy)
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_02", posx, posy)
    elseif( iFrame == 93 ) then
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_01", posx, posy)
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_02", posx, posy)
    elseif( iFrame == 111 ) then
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_01", posx, posy)
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_02", posx, posy)
    elseif( iFrame == 129 ) then
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_01", posx, posy)
        pMonster:AddParticle("Pariot_Destroycircle_Shoot_02", posx, posy)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Thanatos2_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 55 ) then
		pMonster:PlaySound(995007)
		pMonster:AddDamage(DT_THANATOS2_GHOSTOFDEATH_SHOOTER)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Thanatos2_Attack04RFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 59 ) then
		pMonster:PlaySound(995008)
		pMonster:AddDamage(DT_THANATOS2_VAMPIRE_R)
		pMonster:AddDamage(DT_THANATOS2_VAMPIRE_R_DMG)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 
function Thanatos2_Attack04LFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 59 ) then
		pMonster:PlaySound(995008)
		pMonster:AddDamage(DT_THANATOS2_VAMPIRE_L)
		pMonster:AddDamage(DT_THANATOS2_VAMPIRE_L_DMG)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function Thanatos2_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 0, -1600, 1000, 1600, -1000 ) == true ) then
		pMonster:TurnToTarget()
		
		if( pMonster:CheckState( "IDLE" ) == true ) then
			pMonster:SetState( "WAIT" )
		end
        pMonster:ResetDelay()
    end
end

function Thanatos2_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function Thanatos2_Check_MoveUp( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if ( pMonster:FloatRand() < 0.75 ) then
		if( pMonster:GetY() < pMonster:GetTargetY() + 0.10 ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "MOVE_UP" )
			pMonster:ResetDelay()
		end
	end
end

function Thanatos2_Check_MoveDownLeft( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if ( pMonster:FloatRand() < 0.75 ) then
		if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.10 and pMonster:GetX() > pMonster:GetTargetX() ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "MOVE_DOWN_LEFT" )
			pMonster:ResetDelay()
		end
	end
end

function Thanatos2_Check_MoveDownRight( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if ( pMonster:FloatRand() < 0.75 ) then
		if( pMonster:IsTarget() == true and pMonster:GetY() > pMonster:GetTargetY() + 0.10 and pMonster:GetX() < pMonster:GetTargetX() ) then
			pMonster:TurnToTarget()
			pMonster:SetState( "MOVE_DOWN_RIGHT" )
			pMonster:ResetDelay()
		end
	end
end

function Thanatos2_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		if( pMonster:GetY() < pMonster:GetTargetY() + 0.20 and pMonster:GetY() > pMonster:GetTargetY() - 0.20 ) then
			pMonster:SetSpeedX( 0.0 )
			pMonster:SetSpeedY( 0.0 )
			pMonster:SetState( "WAIT" )
			pMonster:ResetDelay()
		end
	end

end

function Thanatos2_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 0, -300, 300, 300, -150 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function Thanatos2_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function Thanatos2_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function Thanatos2_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:IsTarget() == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetSpeedY( 0.0 )
		if( pMonster:GetIsRight() ) then
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK04_RR" )
			else
				pMonster:SetState( "ATTACK04_RL" )
			end
		else
			if( pMonster:FloatRand() < 0.5 ) then
				pMonster:SetState( "ATTACK04_LR" )
			else
				pMonster:SetState( "ATTACK04_LL" )
			end
		end
		pMonster:ResetDelay()
    end
end

function Thanatos2_Check_ToWait( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:SetTarget( 0, -400, 200, 400, -250 ) == true ) then
		if ( pMonster:FloatRand() < 0.75 ) then
			pMonster:SetState( "STONETOWAIT" )
	    	pMonster:ResetDelay()
		end
	end
end

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnThanatos2_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetSpeedX( pMonster:GetSpeedX() * (2.0 / 3.0) )
end

function OnThanatos2_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:TurnToTarget()	
	pMonster:SetPushCheck( false )
	pMonster:SetFly( false )
	pMonster:SetNoCheckContact( 15 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.02 )
	pMonster:SetState( "DIE_LANDING" )
end

function OnThanatos2_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	pMonster:SetPushCheck( true )
	
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
end
