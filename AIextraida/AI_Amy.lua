-- AI_Amy.lua

ActionList =
{
    -- 대기
    {
        ID      = "WAIT",
        Motion  = "1046.frm",
        Func    = "Amy_WaitFunc",

    },

    -- 이동
    {
        ID      = "WALK",
        Motion  = "1048.frm",
        Func    = "Amy_WalkFunc",
        
    },

    -- 필살기
    {
        ID      = "ATTACK01",
        Motion  = "1083.frm",
        Func    = "Amy_Attack01Func",
    },

    -- 필살기
    {
        ID      = "ATTACK02",
        Motion  = "1111.frm",
        Func    = "Amy_Attack02Func",
    },

    -- 일어나기
    {
        ID      = "STANDUP",
        Motion  = "011.frm",
        Func    = "Amy_StandupFunc",
    },

    -- 죽기
    {
        ID      = "DIE",
        Motion  = "011.frm",
        Func    = "Amy_DieFunc",
    },
    
    -- 스톤커스
    {
        ID      = "STONECURSE",
        Motion  = "059.frm",
        Func    = "Amy_StoneCurseFunc",
    },
    
    -- 빙결상태
    {
        ID      = "ICECURSE",
        Motion  = "059.frm",
        Func    = "Amy_IceCurseFunc",
    },
}

CallBack =
{
    Land    = "OnAmy_Land",
    Die     = "OnAmy_Die",
    Damage  = "OnAmy_Damage",
}

-----------------------------------------------------------------------
-- 초기화 함수
-----------------------------------------------------------------------

function InitAmy( iMonsterIndex )
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
function Amy_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )
    end
end

-- 걷기 상태
function Amy_WalkFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    pMonster:SetSpeedX( pMonster:GetWalkSpeed() )
        
    if( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WALK" )
    end
end

-- 필살기 1
function Amy_Attack01Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
    if( iFrame == 25 ) then
		pMonster:PlaySound(717)
	elseif( iFrame == 27 ) then
		pMonster:AddDamageWithLocate(DT_AMY_SPECIAL2_ATK, 0)
		pMonster:PlaySound(682)
	elseif( iFrame == 39 ) then
		pMonster:AddDamageWithLocate(DT_AMY_SPECIAL2_ATK, 0)
		pMonster:PlaySound(682)
	elseif( iFrame == 50 ) then
		pMonster:AddDamageWithLocate(DT_AMY_SPECIAL2_ATK, 0)
		pMonster:PlaySound(682)	
	elseif( iFrame == 70 ) then
		pMonster:AddDamageWithLocate(DT_AMY_SPECIAL2_ATK_LAST, 0)
	elseif( iFrame == 75 ) then
		pMonster:PlaySound(722)
		if( pMonster:GetIsRight() ) then
			pMonster:AddParticleNoDirection("Amy1_specal1-2_01", 0, 0.2, -0.06)
			pMonster:AddParticleNoDirection("Amy1_specal1-2_02", 0, 0.2, -0.06)
		else
			pMonster:AddParticleNoDirection("Amy1_specal1-2_01", 0, -0.2, -0.06)
			pMonster:AddParticleNoDirection("Amy1_specal1-2_02", 0, -0.2, -0.06)
		end
		pMonster:PlaySound(683)
		
	elseif( iFrame == pMonster:GetLastFrame() - 2 ) then
	    pMonster:SetState( "WAIT" )
    end
end

-- 필살기 2
function Amy_Attack02Func( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetInvincible( true )
	
    if( iFrame == 9 ) then
        pMonster:PlaySound(720)
        pMonster:PlaySound(690)
        pMonster:PlaySound(691)        
        local offsety = 0.12
        pMonster:AddParticleNoDirection( "Amy01_special2-2_01", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_02", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_03", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_04", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_05", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_06", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_07", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_08", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_Signboard01", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_Signboard02", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_Signboard03", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_Signboard04", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_Signboard05", 0, offsety )
		pMonster:AddParticleNoDirection( "Amy01_special2-2_Signboard06", 0, offsety )
	elseif( iFrame == pMonster:GetLastFrame() - 2 ) then
	    pMonster:SetState( "WAIT" )
    end
end

-- 죽었음
function Amy_DieFunc( iMonsterIndex, iFrame )
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
function Amy_StandupFunc( iMonsterIndex, iFrame )
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


--  스톤커스 걸렸음
function Amy_StoneCurseFunc( iMonsterIndex, iFrame )
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
function Amy_IceCurseFunc( iMonsterIndex, iFrame )
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
function OnAmy_Land( iMonsterIndex )
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

function OnAmy_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	if( pMonster:CheckState( "STONECURSE" ) == false ) then
		pMonster:SetState( "DIE" )
	end
end

function OnAmy_Damage( iMonsterIndex )
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

function OnAmy_Jump( iMonsterIndex )
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