-- AI_Zero.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "3043.frm",
        Func    = "Zero_WaitFunc",

    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "3044.frm",
        Func    = "Zero_WalkFunc",
        
    },

    -- 대쉬
    {
        ID      = "DASH",
        Motion  = "3045.frm",
        Func    = "Zero_DashFunc",
        
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "011.frm",
        Func    = "Zero_StandupFunc",
    },

    -- 그랑엑스
    {
        ID      = "ATTACK",
        Motion  = "3085.frm",
        Func    = "Zero_GranXFunc",
    },
    
    -- 죽기
    {
        ID      = "DIE",
        Motion  = "011.frm",
        Func    = "Zero_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "059.frm",
        Func    = "Zero_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "059.frm",
        Func    = "Zero_IceCurseFunc",
    },
}

CallBack =
{
    Land    = "OnZero_Land",
    Die     = "OnZero_Die",
    Damage  = "OnZero_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitZero( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_UP,     "DAMAGE_UP" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_MIDDLE, "DAMAGE_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_NORMAL, ATTACKDIR_DOWN,   "DAMAGE_DOWN" )
 
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_UP,       "DOWN_UP01" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_MIDDLE,   "DOWN_MIDDLE" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_DOWN,     "DOWN_DOWN" )
    pMonster:RegistReaction( ATTACKTYPE_DOWN, ATTACKDIR_NORMAL,   "DOWN_SPECIAL" )
    
    pMonster:RegistReaction( ATTACKTYPE_STONECURSE, ATTACKDIR_NORMAL,   "STONECURSE" )
    pMonster:RegistReaction( ATTACKTYPE_ICECURSE, ATTACKDIR_NORMAL,   "ICECURSE" )

    pMonster:SetInvincible( true )  
    
end

-----------------------------------------------------------------------
-- 각 State별 실행되는 함수들..
-----------------------------------------------------------------------

-- 대기 상태
function Zero_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    pMonster:ToggleExtraMesh( "MERGE_WEAPON" , true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end


-- 걷기 상태
function Zero_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 대쉬 상태
function Zero_DashFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )

	if( iFrame == 2 ) then 
		pMonster:PlaySound(4)
	elseif( iFrame == 3 ) then 
		pMonster:EffectDust( pMonster:GetX(), pMonster:GetY(), 7 )	
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "DASH" )
    end
end

-- 죽었음
function Zero_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    if( iFrame <= 1) then
		pMonster:SetInvincible( true )
                pMonster:PlaySound(236)
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:EndMonster()
        pMonster:SetFrameLock( true )
    end
end

-- 일어나기
function Zero_StandupFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	if( iFrame < 16 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -1.0 )
	elseif( iFrame == 25 ) then
		pMonster:SetSpeedX( pMonster:GetWalkSpeed() * 2.0 )
	end
	
    if( iFrame <= 1) then
		pMonster:SetPushCheck( true )
        pMonster:SetSuperArmor( true )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
		if( pMonster:FloatRand() < 0.2 ) then
			pMonster:SetState( "ATTACK02" )
		else
			pMonster:SetState( "WAIT" )        
		end
    end
end

-- 그랑엑스
function Zero_GranXFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    pMonster:ToggleExtraMesh( "WEAPON" , true )
    pMonster:ToggleExtraMesh( "MERGE_WEAPON" , false )
 
    if( iFrame == 50 ) then
        pMonster:PlaySound(1100002)
    elseif( iFrame == 45 ) then        
        pMonster:AddParticleNoDirection( "Zero_GranX_Scratch_R",0.12,-0.3 )	
        pMonster:AddParticleNoDirection( "Zero_Press_01",0.12,-0.15 )			
		pMonster:PlaySound(83017)			
	elseif ( iFrame == 55 ) then
        pMonster:AddParticleNoDirection( "Zero_GranX_Slash_R",-0.3,0.3 )	
        pMonster:AddDamage(DT_ZERO1_GRANX_01_DMG_LV3)
	elseif ( iFrame == 52) then		
        pMonster:AddParticleNoDirection( "Zero_GranA_01_R",0.12,0.12 )
        pMonster:AddParticleNoDirection( "Zero_GranA_02_R",0.12,0.12 )
	elseif ( iFrame == 58 ) then
		pMonster.m_bRender = false 
	elseif ( iFrame == 82 ) then
        pMonster.m_bRender = true
        pMonster:AddParticleNoDirection( "Zero_GranB_01_R",0.15,0.6 )	
        pMonster:AddParticleNoDirection( "Zero_GranB_02_R",0.15,0.6 )	
    elseif ( iFrame == 85 ) then
		pMonster:PlaySound(83017)
		pMonster:PlaySound(567)
		pMonster:AddParticleNoDirection( "Zero_GranX_Start_01/", -0.27, 0.4 )	
		pMonster:AddParticleNoDirection( "Zero_GranX_Start_02/", -0.27, 0.4 )	
		pMonster:AddParticleNoDirection( "Zero_GranX_Start_03/", -0.27, 0.4 )	
		pMonster:AddParticleNoDirection( "Zero_GranX_Start_04/", -0.27, 0.4 )
		pMonster:AddParticleNoDirection( "Zero_GranX_Boom_01/", -0.47, 0.05 )
		pMonster:AddParticleNoDirection( "Zero_GranX_Boom_02/", -0.47, 0.05 )
		pMonster:AddParticleNoDirection( "Zero_GranX_Boom_03/", -0.47, 0.05 )
		pMonster:AddParticleNoDirection( "Zero_GranX_Boom_04/", -0.47, 0.05 )
		pMonster:AddParticleNoDirection( "Zero_GranX_Boom_05/", -0.47, 0.05 )
		pMonster:AddParticleNoDirection( "Zero_GranX_Boom_06/", -0.47, 0.05 )
		pMonster:AddParticleNoDirection( "Zero_GranX_Boom_07/", -0.47, 0.05 )	
    	pMonster:AddDamage(DT_ZERO1_GRANX_02_DMG_LV3)
	elseif( iFrame == pMonster:GetLastFrame() - 2 ) then
	    pMonster:SetState( "WAIT" )
	    pMonster:ToggleExtraMesh( "WEAPON" , false )
	    pMonster:ToggleExtraMesh( "MERGE_WEAPON" , true )
	    
    end
end

--  스톤커스 걸렸음
function Zero_StoneCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "StoneCurse_medium", 3 )
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "StoneCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "StoneCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end

--  아이스커스 걸렸음
function Zero_IceCurseFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

    if( iFrame <= 1) then
        pMonster:SetSuperArmor( true )
        pMonster:AddTraceParticle( "IceCurse_medium", 3 )
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
    elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:AddParticle( "IceCurse_medium_smog01", 0.0, 0.0 )
        pMonster:AddParticle( "IceCurse_medium_tick", 0.0, 0.0 )
        pMonster:SetSuperArmor( false )
        pMonster:SetState( "WAIT" )
        
        if( pMonster:GetHP() <= 0 ) then
			pMonster:SetState( "DIE" )
		end
    end
end


-----------------------------------------------------------------------
-- 컨디션체크
-----------------------------------------------------------------------

-----------------------------------------------------------------------
-- 콜백 함수
-----------------------------------------------------------------------
function OnZero_Land( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    if( pMonster:CheckState( "HIGHJUMP_UP" ) == true or pMonster:CheckState( "HIGHJUMP_DOWN" ) == true ) then
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 2.0 ) / 3.0 )
		pMonster:SetState( "HIGHJUMP_LANDING" )
	elseif( pMonster:CheckState( "DOWN_UP01" ) == true or pMonster:CheckState( "DOWN_UP02" ) == true ) then
        pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )
        pMonster:SetState( "DOWN_UP_LANDING" )
    elseif( pMonster:CheckState( "DOWN_SPECIAL" ) == true ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
		pMonster:SetSpeedX( (pMonster:GetSpeedX() * 1.0 ) / 2.0 )
		pMonster:SetState( "DOWN_UP_LANDING" )
    end
end

function OnZero_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnZero_Damage( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    
    pMonster:SetPushCheck( true )
    pMonster:SetSpeedX( (pMonster:GetSpeedX() * 9.0 ) / 10.0 )
    pMonster:SetSpeedY( ( pMonster:GetSpeedY() * 9.0 ) / 10.0 )
    
    if( pMonster:CheckState( "JUMP" ) == true or pMonster:CheckState( "HIGHJUMP" ) == true ) then
        if( pMonster:IsSuperArmor() == false ) then
            pMonster:SetNoCheckContact( 5 )
        end
	end
    
    if( pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DOWN_DOWN" ) ) then
		pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )		
	end
	
    if( pMonster:CheckPreState( "DOWN_UP01" ) or pMonster:CheckPreState( "DOWN_UP02") ) then
		if( pMonster:CheckState( "DAMAGE_UP" ) or pMonster:CheckState( "DOWN_UP01" )) then
			pMonster:SetSpeedY( 0.028 )
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DAMAGE_MIDDLE" ) or pMonster:CheckState( "DOWN_MIDDLE" ) or pMonster:CheckState( "DAMAGE_DOWN" ) ) then
			pMonster:SetSpeedX( pMonster:GetSpeedX() / 2 )
			pMonster:SetSpeedY( 0.019 )			
			pMonster:SetState( "DOWN_UP01" )		
		elseif( pMonster:CheckState( "DOWN_DOWN" )) then
			pMonster:SetSpeedX( pMonster:GetWalkSpeed() * -2.0 )
			pMonster:SetSpeedY( -0.04 )			
			pMonster:SetState( "DOWN_UP02" )		
			pMonster:SetDownDelay( 40 + (pMonster:FloatRand() * 50) )			
		end	
	end
	
	if( pMonster:CheckState( "DOWN_UP01" ) == false and pMonster:CheckState( "DOWN_MIDDLE" ) == false and pMonster:CheckState( "DOWN_DOWN" ) == false and pMonster:CheckState( "DOWN_SPECIAL" ) == false and pMonster:CheckState( "STONECURSE" ) == false ) then
		if ( pMonster:GetIsContact() == true and pMonster:FloatRand() < 0.1 ) then
            pMonster:TurnToTarget()
            pMonster:SetState( "ATTACK02" )
            pMonster:SetSuperArmor(true)
		end
    end
end

function OnZero_Jump( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	local fTargetX = pMonster:GetTargetX()
	local fTargetY = pMonster:GetTargetY()
	
	local fMonX = pMonster:GetX()
	local fMonY = pMonster:GetY()
		
	fSpeedX = ( fTargetX - fMonX ) * 1.5
	fSpeedY = ((fTargetY - fMonY) / ((fTargetY - fMonY) / 3.9)) + (((fTargetY - fMonY) * 1.6) + pMonster:FloatAbs((fSpeedX / 3.0)))
	
	pMonster:SetNoCheckContact(26 + (fSpeedY * 4.8))
	pMonster:TurnToTarget()
	pMonster:SetSpeedX( fSpeedX * 0.01 )
	pMonster:SetSpeedY( fSpeedY * 0.01 )
end