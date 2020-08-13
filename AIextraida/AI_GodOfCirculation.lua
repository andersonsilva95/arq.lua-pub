-- AI_GodOfCirculation.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "GodOfCirculation_Wait.frm",
        Func    = "GodOfCirculation_WaitFunc",

        Trigger =
        {
			-- 타게팅
            {
                AICheckFrame        = 15,
                AIFunc              = "GodOfCirculation_Check_Targeting",
                DelayFrame          = 125,
            },
            -- 타겟을 향해 턴
            {
                AICheckFrame        = 75,
                AIFunc              = "GodOfCirculation_Check_TurnToTarget",
                DelayFrame          = 75,
            },
            -- 걷기
            {
                AICheckFrame        = 75,
                AIFunc              = "GodOfCirculation_Check_Walk",
                DelayFrame          = 110,
            },
            -- 걷어차기 
            {
                AICheckFrame        = 75,
                AIFunc              = "GodOfCirculation_Check_Attack01",
                DelayFrame          = 165,
            },
            -- 폰치 
            {
                AICheckFrame        = 75,
                AIFunc              = "GodOfCirculation_Check_Attack02",
                DelayFrame          = 165,
            },
            -- 매직 미사일
            {
                AICheckFrame        = 165,
                AIFunc              = "GodOfCirculation_Check_Attack03",
                DelayFrame          = 330,
            },
            -- 점프
            {
                AICheckFrame        = 165,
                AIFunc              = "GodOfCirculation_Check_Attack04",
                DelayFrame          = 330,
            },
            -- 초필살기
            {
                AICheckFrame        = 110,
                AIFunc              = "GodOfCirculation_Check_Attack05Jump",
                DelayFrame          = 440,
            },
        },
    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "GodOfCirculation_Wait.frm",
        Func    = "GodOfCirculation_WalkFunc",

        Trigger =
        {
			-- 타게팅
			{
                AICheckFrame        = 25,
                AIFunc              = "GodOfCirculation_Check_Targeting",
                DelayFrame          = 110,
            },
			-- 타겟을 향해 턴
            {
                AICheckFrame        = 55,
                AIFunc              = "GodOfCirculation_Check_TurnToTarget",
                DelayFrame          = 55,
            },
			-- 걷어차기 
            {
                AICheckFrame        = 75,
                AIFunc              = "GodOfCirculation_Check_Attack01",
                DelayFrame          = 110,
            },
            -- 폰치 
            {
                AICheckFrame        = 75,
                AIFunc              = "GodOfCirculation_Check_Attack02",
                DelayFrame          = 110,
            },
			-- 점프
            {
                AICheckFrame        = 110,
                AIFunc              = "GodOfCirculation_Check_Attack04",
                DelayFrame          = 220,
            },
            -- 멈추기
            {
                AICheckFrame        = 10,
                AIFunc              = "GodOfCirculation_Check_Stop",
                DelayFrame          = 55,
            }, 
        }
    },
    
    -- 킥 
    {
        ID      = "ATTACK01",
        Motion  = "GodOfCirculation_Attack01.frm",
        Func    = "GodOfCirculation_Attack01Func",
    },
    
    -- 펀치 
    {
        ID      = "ATTACK02",
        Motion  = "GodOfCirculation_Attack02.frm",
        Func    = "GodOfCirculation_Attack02Func",
    },
    
    -- 매직 미사일 
    {
        ID      = "ATTACK03",
        Motion  = "GodOfCirculation_Attack03_2.frm",
        Func    = "GodOfCirculation_Attack03Func",
    },
        
    -- 날아오르기 준비 
    {
        ID      = "ATTACK04READY",
        Motion  = "GodOfCirculation_Attack04_READY.frm",
        Func    = "GodOfCirculation_Attack04ReadyFunc",
    },
    -- 날아오르기 
    {
        ID      = "ATTACK04UP",
        Motion  = "GodOfCirculation_Attack04_UP.frm",
        Func    = "GodOfCirculation_Attack04UpFunc",
		Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "GodOfCirculation_Check_Attack04_Target",
                DelayFrame          = 0,
            },
        }
    },
    -- 떨어지기 
    {
        ID      = "ATTACK04DOWN",
        Motion  = "GodOfCirculation_Attack04_DOWN.frm",
        Func    = "GodOfCirculation_Attack04DownFunc",
    },
    -- 착지 
    {
        ID      = "ATTACK04BOMB",
        Motion  = "GodOfCirculation_Attack04_BOMB.frm",
        Func    = "GodOfCirculation_Attack04BombFunc",
    },
	-- 날아오르기2 준비(레이져 전초)
    {
        ID      = "ATTACK05READY",
        Motion  = "GodOfCirculation_Attack04_READY.frm",
        Func    = "GodOfCirculation_Attack05ReadyFunc",
    },
    -- 날아오르기 
    {
        ID      = "ATTACK05UP",
        Motion  = "GodOfCirculation_Attack04_UP.frm",
        Func    = "GodOfCirculation_Attack05UpFunc",
		Trigger =
        {
            {
                AICheckFrame        = 1,
                AIFunc              = "GodOfCirculation_Check_Attack05_Target",
                DelayFrame          = 0,
            },
        }
    },
	-- 떨어지기 
    {
        ID      = "ATTACK05DOWN",
        Motion  = "GodOfCirculation_Attack04_DOWN.frm",
        Func    = "GodOfCirculation_Attack05DownFunc",
    },
    -- 착지 
    {
        ID      = "ATTACK05BOMB",
        Motion  = "GodOfCirculation_Attack04_BOMB.frm",
        Func    = "GodOfCirculation_Attack05BombFunc",
    },
     -- 레이저 빔!!!! 
    {
        ID      = "ATTACK05",
        Motion  = "GodOfCirculation_Attack05.frm",
        Func    = "GodOfCirculation_Attack05Func",
    },
    
    -- 원기옥 
    {
        ID      = "ATTACK06",
        Motion  = "GodOfCirculation_Attack06.frm",
        Func    = "GodOfCirculation_Attack06Func",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "GodOfCirculation_Die.frm",
        Func    = "GodOfCirculation_DieFunc",
    },
    -- 데미지 입어서 부위 파괴
    {
        ID      = "FORM_CHANGE",
        Motion  = "GodofCirculation_Howling.frm",
        Func    = "GodOfCirculation_ChangeFunc",
    },
}

CallBack =
{
    Land    = "OnGodOfCirculation_Land",
    Die     = "OnGodOfCirculation_Die",
    Damage  = "OnGodOfCirculation_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitGodOfCirculation( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
--[[
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DAMAGE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DAMAGE" )
--]]
    
    pMonster:SetMeshRender( 2, false )
    pMonster:SetMeshRender( 3, false )
	pMonster:SetY( 0.23 )
	
	--g_kCamera:SetZoom( 7.0, -1 )
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function GodOfCirculation_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
    
    if( pMonster:GetHP() < pMonster:GetMaxHP() * 0.8 and pMonster:GetMeshRender( 1 ) == true ) then
	    pMonster:SetInvincible( true )
	    pMonster:SetState( "FORM_CHANGE" )	
	elseif( pMonster:GetHP() < pMonster:GetMaxHP() * 0.6 and pMonster:GetMeshRender( 2 ) == false ) then
	    pMonster:SetInvincible( true )
	    pMonster:SetState( "FORM_CHANGE" )	
	end
end

-- 걷기 상태
function GodOfCirculation_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 죽는상태
function GodOfCirculation_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
		pMonster:PlaySound(987035)
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
    end
end


function GodOfCirculation_ChangeFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame <= 1 ) then
		pMonster:SetInvincible( true )
	elseif( iFrame == 40 ) then    
	    if ( pMonster:GetMeshRender( 1 ) == true ) then
	        local posy = 2.7
            local posx = -0.3
            pMonster:AddParticle( "Circulation_mask_break 01", posx,posy  )
            pMonster:AddParticle( "Circulation_mask_break 02", posx,posy  )
            pMonster:AddParticle( "Circulation_mask_break 03", posx,posy  )
            pMonster:SetMeshRender( 1 , false )
	        pMonster:SetMeshRender( 3 , true )
	    elseif ( pMonster:GetMeshRender( 2 ) == false ) then
	        pMonster:SetMeshRender( 2 , true )
	        pMonster:FlashScreen()
	    end	    
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 데미지 입은거
function GodOfCirculation_DamageFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  걷어차 
function GodOfCirculation_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
	if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )        
	elseif( iFrame == 52 ) then
		pMonster:PlaySound(589)
		pMonster:AddDamage( DT_VANESSA_GOD_ATK1 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 펀치 
function GodOfCirculation_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
  
    if( iFrame <= 1) then
		pMonster:SetSuperArmor( true )        
    elseif( iFrame == 51 ) then
		pMonster:PlaySound(590)
		pMonster:AddDamage( DT_VANESSA_GOD_ATK2 )		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "WAIT" )
    end
end

-- 매직미사일 
function GodOfCirculation_Attack03Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )        
    elseif( iFrame == 51 ) then
	pMonster:PlaySound(592)
        if( pMonster:GetIsRight() == true ) then
	        pMonster:AddDamage( DT_VANESSA_GOD_ATK3 )	
	    else
	        pMonster:AddDamage( DT_VANESSA_GOD_ATK3_R )	
	    end
		
	elseif( iFrame == pMonster:GetLastFrame() - 20 ) then
	pMonster:PlaySound(591)	
	    local iDir = 0
	    if( pMonster:GetIsRight() == true ) then
	        iDir = -1
	    else
	        iDir = 1
	    end
	    for i = 0, 17 do
	        pMonster:AddDamageWithLocateAngle( DT_VANESSA_GOD_ATK3_MISSILE, 0.0, 0.0, false, -0.0 + i * 0.35 * iDir )				
	    end	    		
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )        
        pMonster:SetState( "WAIT" )
    end
end

--  점프 준비!! 
function GodOfCirculation_Attack04ReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
	pMonster:SetSuperArmor( true )     
        pMonster.fReserveValue = pMonster:GetY()

    elseif( iFrame == 54 ) then

    elseif( iFrame == 97 ) then
	elseif( iFrame >= pMonster:GetLastFrame() ) then
	
        pMonster:SetState("ATTACK04UP")
    end
end
function GodOfCirculation_Attack04UpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 1 ) then
		pMonster:PlaySound(593)
		pMonster:SetSuperArmor( true ) 
        pMonster:SetSpeedY( 0.3 )
        pMonster:StartText("JUMP")
    elseif( iFrame == 97 ) then        
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK04DOWN" )
    end	
end
--추락!!!!!! 
function GodOfCirculation_Attack04DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
	    pMonster:SetSuperArmor( true ) 
		pMonster:SetSpeedY( -0.34 )
		pMonster:SetNoCheckContact(65)
        pMonster:SetIgnoreFHCheck(false)
        pMonster:AddDamage( DT_VANESSA_GOD_ATK4_KICK )
	elseif( iFrame >= pMonster:GetLastFrame() ) then   --조건을 땅에 닿으면으로 변경 
	    pMonster:SetFrameLock( true )
    end
    if(pMonster:GetY() <= pMonster.fReserveValue) then
    	pMonster:SetY(pMonster.fReserveValue)
		pMonster:SetState( "ATTACK04BOMB" )
	elseif( pMonster:GetY() <= pMonster.fReserveValue + 1.9 ) then
	    pMonster:AddDamage( DT_VANESSA_GOD_ATK4_BOOM )	   
	    pMonster:EarthQuake( 30, 0.06, 0.03 ) 
    end 
end
--대운하 키크!!!! 
function GodOfCirculation_Attack04BombFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
	    pMonster:SetState( "WAIT" )
    end
end

--  점프 준비!! 
function GodOfCirculation_Attack05ReadyFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
		pMonster:SetSuperArmor( true )     
        pMonster.fReserveValue = pMonster:GetY()
    elseif( iFrame == 54 ) then
		pMonster:StartText("DANGER")
    elseif( iFrame == 97 ) then
        print("순간 이동!!!!!!") 
	elseif( iFrame >= pMonster:GetLastFrame() ) then	
        pMonster:SetState("ATTACK05UP")
    end
end

function GodOfCirculation_Attack05UpFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame == 1 ) then
		pMonster:PlaySound(593)
		pMonster:SetSuperArmor( true ) 
        pMonster:SetSpeedY( 0.3 )
        pMonster:StartText("DANGER")
    elseif( iFrame == 97 ) then        
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetState( "ATTACK05DOWN" )
    end	
end

--추락!!!!!! 
function GodOfCirculation_Attack05DownFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
	    pMonster:SetSuperArmor( true ) 
		pMonster:SetSpeedY( -0.34 )
		pMonster:SetNoCheckContact(65)
        pMonster:SetIgnoreFHCheck(false)
        pMonster:AddDamage( DT_VANESSA_GOD_ATK4_KICK )
	elseif( iFrame >= pMonster:GetLastFrame() ) then   --조건을 땅에 닿으면으로 변경 
	    pMonster:SetFrameLock( true )
    end
    if(pMonster:GetY() <= pMonster.fReserveValue) then
    	pMonster:SetY(pMonster.fReserveValue)
		pMonster:SetState( "ATTACK05BOMB" )
	elseif( pMonster:GetY() <= pMonster.fReserveValue + 1.9 ) then
	    pMonster:AddDamage( DT_VANESSA_GOD_ATK4_BOOM )	   
	    pMonster:EarthQuake( 30, 0.06, 0.03 ) 
    end 
end
--대운하 키크!!!! 
function GodOfCirculation_Attack05BombFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame >= pMonster:GetLastFrame() ) then
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetState( "ATTACK05" )
		else
			pMonster:SetState( "ATTACK06" )
		end
    end
end

--  화이날!! 프렉샤!!!! 
function GodOfCirculation_Attack05Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame == 1 ) then
        pMonster:SetSuperArmor( true )	
    elseif( iFrame == 35 ) then	
        if( pMonster:GetIsRight() == true ) then
            pMonster:AddDamage( DT_VANESSA_GOD_ATK5 )
        else
            pMonster:AddDamage( DT_VANESSA_GOD_ATK5_R )
        end
    elseif(iFrame == 65) then
		pMonster:PlaySound(594)
    elseif( iFrame >= 165 and iFrame % 5 == 0 and iFrame <= 205) then                    
		pMonster:AddDamage( DT_VANESSA_GOD_ATK5_DMG_MAIN )
        pMonster:AddDamage( DT_VANESSA_GOD_ATK5_DMG_SUB_1 )
        pMonster:AddDamage( DT_VANESSA_GOD_ATK5_DMG_SUB_2 )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

--  원기옥!!! 
function GodOfCirculation_Attack06Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( iFrame <= 1 ) then
        pMonster:SetSuperArmor( true )
    elseif( iFrame == 33 ) then
          pMonster:PlaySound(596)
        pMonster:AddDamage( DT_VANESSA_GOD_ATK6_READY )        
    elseif( iFrame == 103 ) then
		pMonster:PlaySound(595)
        pMonster:AddDamage( DT_VANESSA_GOD_ATK6_BALL )        
        --pMonster:AddDamage( DT_VANESSA_GOD_ATK6_EXPLOSION )        
    elseif( iFrame == 105 ) then
	            pMonster:PlaySound(597)
   	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
    end
end

-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

function GodOfCirculation_Check_Targeting( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:SetTarget( 100, -800, 600, 800, -600 ) == true ) then
        pMonster:TurnToTarget()
	pMonster:ResetDelay()
    end
end

function GodOfCirculation_Check_TurnToTarget( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:IsTarget() == true ) then
		pMonster:TurnToTarget()
		pMonster:ResetDelay()
	end
end

function GodOfCirculation_Check_Walk( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( pMonster:IsTarget() == true and pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == false ) then
		pMonster:TurnToTarget()
        pMonster:SetState( "WALK" )
        pMonster:ResetDelay()
    end
end

function GodOfCirculation_Check_Stop( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( pMonster:CheckTargetInRange( 150, -160, 500, 160, -500 ) == true ) then
		pMonster:SetSpeedX( 0.0 )
		pMonster:SetState( "WAIT" )
		pMonster:ResetDelay()
	end
end

function GodOfCirculation_Check_Attack01( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 270,-270,560,270,-20 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK01" )
		pMonster:ResetDelay()
    end
end

function GodOfCirculation_Check_Attack02( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if( pMonster:CheckTargetInRange( 270,-270,1230,270,550 ) == true ) then
		pMonster:AddCountValue(1)
		pMonster:SetState( "ATTACK02" )
		pMonster:ResetDelay()
    end
end

function GodOfCirculation_Check_Attack03( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if(pMonster:GetHP()/pMonster:GetMaxHP() <= 0.85) then
		pMonster:AddCountValue(1)
		pMonster:TurnToTarget()
		pMonster:SetState( "ATTACK03" )
		pMonster:ResetDelay()
    end
end

function GodOfCirculation_Check_Attack04( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    

    if(pMonster:GetHP()/pMonster:GetMaxHP() <= 0.85) then
		pMonster:AddCountValue(1)
    	pMonster:SetState( "ATTACK04READY" )
		pMonster:ResetDelay()
    end
end

function GodOfCirculation_Check_Attack04_Target( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	
    if( iFrame == 40 ) then
        iTargetX = pMonster:GetTargetX()
        pMonster:SetX(iTargetX)
    end
end

function GodOfCirculation_Check_Attack05_Target( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )    
	
    if( iFrame == 40 ) then
		if ( pMonster:FloatRand() < 0.5 ) then
			pMonster:SetX(0.05)
			pMonster:SetIsRight( true )
		else
			pMonster:SetX(4.4)
			pMonster:SetIsRight( false )   
		end
    end
end

function GodOfCirculation_Check_Attack05Jump( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )   
	
    if(pMonster:GetHP()/pMonster:GetMaxHP() <= 0.65 and pMonster:GetCountValue() >= 3 ) then
		pMonster:SetCountValue(0)
		pMonster:TurnToTarget()
    	pMonster:SetState( "ATTACK05READY" )
		pMonster:ResetDelay()
    end
end


-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnGodOfCirculation_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "ATTACK04DOWN" ) == true ) then
    	pMonster:SetState( "ATTACK04BOMB" )
    end
    
end

function OnGodOfCirculation_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_UP02" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false) then
		pMonster:TurnToTarget()	
		pMonster:SetState( "DIE" )
	end
	
end

function OnGodOfCirculation_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetNoCheckContact( 0 )
	pMonster:SetSpeedX( 0.0 )
	pMonster:SetSpeedY( 0.0 )
	   
    pMonster:SetPushCheck( true )
	pMonster:SetFly( false ) 
	
	--피가 80% 미만인데 마스크가 켜져있다면
	if( pMonster:GetHP() < pMonster:GetMaxHP() * 0.8 and pMonster:GetMeshRender( 1 ) == true ) then
	    pMonster:SetInvincible( true )
	    pMonster:SetState( "FORM_CHANGE" )	
	elseif( pMonster:GetHP() < pMonster:GetMaxHP() * 0.6 and pMonster:GetMeshRender( 2 ) == false ) then
	    pMonster:SetInvincible( true )
	    pMonster:SetState( "FORM_CHANGE" )
	else
	    if ( pMonster:FloatRand() < 0.1 and pMonster:IsSuperArmor() == false ) then	
		    if ( pMonster:FloatRand() < 0.5 ) then
			    pMonster:SetState( "ATTACK03" )	
		    else
			    pMonster:SetState( "ATTACK04READY" )	
		    end
            pMonster:SetSuperArmor(true)
	    end
	end
end
