-- AI_CownatCube.lua

ActionList =
{
    -- ���
    {
        ID      = "WAIT",
        Motion  = "cube.frm",
        Func    = "CownatCube_WaitFunc",
    },

    -- �ױ�
    {
        ID      = "DIE",
        Motion  = "cube.frm",
        Func    = "CownatCube_DieFunc",
    },
}

CallBack =
{
    Die     = "OnCownatCube_Die",
}

-----------------------------------------------------------------------
-- �ʱ�ȭ �Լ�
-----------------------------------------------------------------------

function InitCownatCube( iMonsterIndex )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
    pMonster:SetSpeedX( 0.0 )
    pMonster:SetSpeedY( 0.0 )
    pMonster:SetFly( true )
    pMonster:SetY( 0.8 )
    pMonster:SetCountValue( 0 )
end

-----------------------------------------------------------------------
-- �� State�� ����Ǵ� �Լ���..
-----------------------------------------------------------------------

-- ��� ����
function CownatCube_WaitFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )

	local offsetY = 0.00035

	if( iFrame <= 15 ) then
		pMonster:SetY( pMonster:GetY() + offsetY *iFrame )
	elseif( iFrame <= 67 ) then
		pMonster:SetY( pMonster:GetY() + offsetY *(68 -iFrame) )
	elseif( iFrame <= 82 ) then
		pMonster:SetY( pMonster:GetY() - offsetY *(iFrame -67) )
	elseif( iFrame <= 134 ) then
		pMonster:SetY( pMonster:GetY() - offsetY *(135 -iFrame) )
	elseif( iFrame >= pMonster:GetLastFrame() ) then
		pMonster:SetY( 0.8 )
        pMonster:SetState( "WAIT" )        
    end

	--[[
	if( 1 <= iFrame and iFrame < pMonster:GetLastFrame() ) then
	    if( pMonster:GetCountValue() == 0 ) then
            pMonster:SetY( pMonster:GetY() + 0.01 )
            if( pMonster:GetY() >= 1.25 ) then 
                pMonster:SetCountValue( 1 )
                for i=0, 20  do
                    pMonster:SetY( pMonster:GetY() - 0.001 )
                end
            end
        elseif( pMonster:GetCountValue() == 1 ) then     
	        pMonster:SetY( pMonster:GetY() - 0.01 )
	        if( pMonster:GetY() <= 0.8 ) then 
	            pMonster:SetCountValue( 0 )
	            for i=0, 20  do
                    pMonster:SetY( pMonster:GetY() + 0.001 )
                end
	        end 
	    end
	elseif( iFrame >= pMonster:GetLastFrame() ) then
        pMonster:SetState( "WAIT" )        
    end
	--]]
end

-- �״»���
function CownatCube_DieFunc( iMonsterIndex, iFrame )
    local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	local pWhaleBox = g_MyD3D:GetMonster( iMonsterIndex + 1 )
    
    if( iFrame == 0 ) then 
		pMonster:SetInvincible( true )
  
        pMonster:AddParticle( "Scorpis_Critical_Hit_01", 0.0, 0.0 )
        pMonster:AddParticle( "Scorpis_Critical_Hit_02", 0.0, 0.0 )
        pMonster:AddParticle( "Furious_Storm_Stormcut_Hit_01", 0.0, 0.02 )
        pMonster:AddParticle( "Scorpis_Critical_Hit_04", 0.0, 0.0 )
        pMonster:AddParticle( "Cube_Boom", 0.0, 0.0 )

		pMonster:EndMonster(false, true)
		pMonster:SetFrameLock( true )
	    pWhaleBox:SetState( "DIE" )
	end
end


-----------------------------------------------------------------------
-- �����üũ
-----------------------------------------------------------------------


-----------------------------------------------------------------------
-- �ݹ� �Լ�
-----------------------------------------------------------------------
function OnCownatCube_Die( iMonsterIndex )
	local pMonster = g_MyD3D:GetMonster( iMonsterIndex )
	
	pMonster:SetState( "DIE" )
end
